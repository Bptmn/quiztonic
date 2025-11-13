#!/bin/bash

# Build Android - Check configuration and build for Android
# Usage: ./scripts/build_android.sh

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}QuizTonic - Android Build Script${NC}"
echo -e "${BLUE}========================================${NC}\n"

# Check Flutter installation
echo -e "${YELLOW}📱 Checking Flutter installation...${NC}"
if ! command -v flutter &> /dev/null; then
    echo -e "${RED}❌ Flutter is not installed or not in PATH${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Flutter found: $(flutter --version | head -n 1)${NC}\n"

# Check Android SDK
echo -e "${YELLOW}🤖 Checking Android SDK...${NC}"
if [[ -z "$ANDROID_HOME" && -z "$ANDROID_SDK_ROOT" ]]; then
    echo -e "${RED}❌ ANDROID_HOME or ANDROID_SDK_ROOT is not set${NC}"
    echo -e "${YELLOW}Set in ~/.zshrc or ~/.bashrc:${NC}"
    echo -e "  export ANDROID_HOME=\$HOME/Library/Android/sdk"
    exit 1
fi
echo -e "${GREEN}✓ Android SDK found${NC}\n"

# Navigate to project root
cd "$(dirname "$0")/.."

# Check essential Android files
echo -e "${YELLOW}📋 Checking Android configuration files...${NC}"
if [[ ! -f "android/app/build.gradle" ]]; then
    echo -e "${RED}❌ android/app/build.gradle not found${NC}"
    exit 1
fi
if [[ ! -f "android/build.gradle" ]]; then
    echo -e "${RED}❌ android/build.gradle not found${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Android configuration files found${NC}\n"

# Check Firebase configuration
echo -e "${YELLOW}🔥 Checking Firebase configuration...${NC}"
if [[ ! -f "android/app/google-services.json" ]]; then
    echo -e "${RED}❌ android/app/google-services.json not found${NC}"
    echo -e "${YELLOW}Download from Firebase Console and place in android/app/${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Firebase configuration found${NC}\n"

# Check signing configuration (optional warning)
echo -e "${YELLOW}🔐 Checking signing configuration...${NC}"
if [[ ! -f "android/key.properties" ]]; then
    echo -e "${YELLOW}⚠️  android/key.properties not found${NC}"
    echo -e "${YELLOW}   Building with debug signing. For release builds, configure signing:${NC}"
    echo -e "   https://docs.flutter.dev/deployment/android#signing-the-app${NC}\n"
else
    echo -e "${GREEN}✓ Signing configuration found${NC}\n"
fi

# Get dependencies
echo -e "${YELLOW}📥 Getting Flutter dependencies...${NC}"
flutter pub get
if [[ $? -ne 0 ]]; then
    echo -e "${RED}❌ Failed to get dependencies${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Dependencies installed${NC}\n"

# Clean previous builds
echo -e "${YELLOW}🧹 Cleaning previous builds...${NC}"
flutter clean
flutter pub get
echo -e "${GREEN}✓ Clean complete${NC}\n"

# Build for Android (APK)
echo -e "${YELLOW}🔨 Building Android APK (Release mode)...${NC}"
flutter build apk --release
if [[ $? -ne 0 ]]; then
    echo -e "${RED}❌ Android APK build failed${NC}"
    exit 1
fi

# Build for Android (App Bundle)
echo -e "${YELLOW}🔨 Building Android App Bundle (Release mode)...${NC}"
flutter build appbundle --release
if [[ $? -ne 0 ]]; then
    echo -e "${RED}❌ Android App Bundle build failed${NC}"
    exit 1
fi

echo -e "\n${GREEN}========================================${NC}"
echo -e "${GREEN}✅ Android Build Successful!${NC}"
echo -e "${GREEN}========================================${NC}"
echo -e "${BLUE}APK location: build/app/outputs/flutter-apk/app-release.apk${NC}"
echo -e "${BLUE}App Bundle location: build/app/outputs/bundle/release/app-release.aab${NC}"
echo -e "${YELLOW}Next steps:${NC}"
echo -e "  1. Test the APK on a device"
echo -e "  2. Upload the App Bundle (.aab) to Google Play Console"
echo -e "${GREEN}========================================${NC}\n"

