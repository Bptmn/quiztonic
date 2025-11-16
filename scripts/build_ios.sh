#!/bin/bash

# Build iOS - Check configuration and build for iOS
# Usage: ./scripts/build_ios.sh

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}QuizTonic - iOS Build Script${NC}"
echo -e "${BLUE}========================================${NC}\n"

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo -e "${RED}❌ Error: iOS builds are only supported on macOS${NC}"
    exit 1
fi

# Check Flutter installation
echo -e "${YELLOW}📱 Checking Flutter installation...${NC}"
if ! command -v flutter &> /dev/null; then
    echo -e "${RED}❌ Flutter is not installed or not in PATH${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Flutter found: $(flutter --version | head -n 1)${NC}\n"

# Check Xcode installation
echo -e "${YELLOW}🔧 Checking Xcode installation...${NC}"
if ! command -v xcodebuild &> /dev/null; then
    echo -e "${RED}❌ Xcode is not installed${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Xcode found: $(xcodebuild -version | head -n 1)${NC}\n"

# Check CocoaPods installation
echo -e "${YELLOW}📦 Checking CocoaPods installation...${NC}"
if ! command -v pod &> /dev/null; then
    echo -e "${RED}❌ CocoaPods is not installed${NC}"
    echo -e "${YELLOW}Install with: sudo gem install cocoapods${NC}"
    exit 1
fi
echo -e "${GREEN}✓ CocoaPods found: $(pod --version)${NC}\n"

# Navigate to project root
cd "$(dirname "$0")/.."

# Check essential iOS files
echo -e "${YELLOW}📋 Checking iOS configuration files...${NC}"
if [[ ! -f "ios/Runner/Info.plist" ]]; then
    echo -e "${RED}❌ ios/Runner/Info.plist not found${NC}"
    exit 1
fi
if [[ ! -f "ios/Runner.xcodeproj/project.pbxproj" ]]; then
    echo -e "${RED}❌ iOS project file not found${NC}"
    exit 1
fi
echo -e "${GREEN}✓ iOS configuration files found${NC}\n"

# Check Firebase configuration
echo -e "${YELLOW}🔥 Checking Firebase configuration...${NC}"
if [[ ! -f "ios/Runner/GoogleService-Info.plist" ]]; then
    echo -e "${RED}❌ ios/Runner/GoogleService-Info.plist not found${NC}"
    echo -e "${YELLOW}Download from Firebase Console and place in ios/Runner/${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Firebase configuration found${NC}\n"

# Get dependencies
echo -e "${YELLOW}📥 Getting Flutter dependencies...${NC}"
flutter pub get
if [[ $? -ne 0 ]]; then
    echo -e "${RED}❌ Failed to get dependencies${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Dependencies installed${NC}\n"

# Install iOS pods
echo -e "${YELLOW}📦 Installing iOS CocoaPods dependencies...${NC}"
cd ios
pod install
if [[ $? -ne 0 ]]; then
    echo -e "${RED}❌ Failed to install pods${NC}"
    cd ..
    exit 1
fi
cd ..
echo -e "${GREEN}✓ CocoaPods dependencies installed${NC}\n"

# Clean previous builds
echo -e "${YELLOW}🧹 Cleaning previous builds...${NC}"
flutter clean
flutter pub get
echo -e "${GREEN}✓ Clean complete${NC}\n"

# Bump version (marketing and build) before building
echo -e "${YELLOW}🔢 Bumping iOS version (marketing + build)...${NC}"

# Read current version from pubspec.yaml (format: version: X.Y.Z+N)
CURRENT_VERSION_LINE=$(grep -E '^version:\s*[0-9]+\.[0-9]+\.[0-9]+\+[0-9]+' pubspec.yaml || true)
if [[ -z "$CURRENT_VERSION_LINE" ]]; then
  echo -e "${YELLOW}⚠️  Could not detect current version in pubspec.yaml. Using defaults 1.0.0+1${NC}"
  CURRENT_VERSION="1.0.0"
  CURRENT_BUILD="1"
else
  CURRENT_VERSION=$(echo "$CURRENT_VERSION_LINE" | sed -E 's/version:\s*([0-9]+\.[0-9]+\.[0-9]+)\+([0-9]+)/\1/')
  CURRENT_BUILD=$(echo "$CURRENT_VERSION_LINE" | sed -E 's/version:\s*([0-9]+\.[0-9]+\.[0-9]+)\+([0-9]+)/\2/')
fi

# Allow overrides via env vars
REQUESTED_BUMP=${BUMP:-patch} # major|minor|patch
NEW_BUILD=${BUILD_NUMBER:-}
NEW_VERSION=${BUILD_NAME:-}

IFS='.' read -r MAJOR MINOR PATCH <<< "$CURRENT_VERSION"
if [[ -z "$NEW_VERSION" ]]; then
  case "$REQUESTED_BUMP" in
    major) MAJOR=$((MAJOR+1)); MINOR=0; PATCH=0 ;;
    minor) MINOR=$((MINOR+1)); PATCH=0 ;;
    patch|*) PATCH=$((PATCH+1)) ;;
  esac
  NEW_VERSION="${MAJOR}.${MINOR}.${PATCH}"
fi

if [[ -z "$NEW_BUILD" ]]; then
  # Increment build number or start at 1 if missing
  if [[ -z "$CURRENT_BUILD" ]]; then
    NEW_BUILD=1
  else
    NEW_BUILD=$((CURRENT_BUILD+1))
  fi
fi

# Update pubspec.yaml version line
echo -e "${BLUE}Setting version to ${NEW_VERSION}+${NEW_BUILD}${NC}"
sed -i '' -E "s/^version:\s*[0-9]+\.[0-9]+\.[0-9]+\+[0-9]+/version: ${NEW_VERSION}+${NEW_BUILD}/" pubspec.yaml

# Build for iOS
echo -e "${YELLOW}🔨 Building iOS app (Release mode)...${NC}"
flutter build ios --release --build-name="${NEW_VERSION}" --build-number="${NEW_BUILD}"
if [[ $? -ne 0 ]]; then
    echo -e "${RED}❌ iOS build failed${NC}"
    exit 1
fi

echo -e "\n${GREEN}========================================${NC}"
echo -e "${GREEN}✅ iOS Build Successful!${NC}"
echo -e "${GREEN}========================================${NC}"
echo -e "${BLUE}Build location: build/ios/iphoneos/Runner.app${NC}"
echo -e "${YELLOW}Next steps:${NC}"
echo -e "  1. Open Xcode: open ios/Runner.xcworkspace"
echo -e "  2. Select your device/provisioning profile"
echo -e "  3. Archive and upload to App Store Connect"
echo -e "${GREEN}========================================${NC}\n"

