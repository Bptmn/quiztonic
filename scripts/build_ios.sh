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

# Build for iOS
echo -e "${YELLOW}🔨 Building iOS app (Release mode)...${NC}"
flutter build ios --release
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

