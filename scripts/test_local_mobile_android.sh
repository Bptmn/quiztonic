#!/bin/bash

# Test Local Mobile Android - Build and launch on Android emulator
# Usage: ./scripts/test_local_mobile_android.sh

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}QuizTonic - Android Local Test${NC}"
echo -e "${BLUE}========================================${NC}\n"

# Check Flutter installation
echo -e "${YELLOW}📱 Checking Flutter installation...${NC}"
if ! command -v flutter &> /dev/null; then
    echo -e "${RED}❌ Flutter is not installed or not in PATH${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Flutter found${NC}\n"

# Check Android SDK
echo -e "${YELLOW}🤖 Checking Android SDK...${NC}"
if [[ -z "$ANDROID_HOME" && -z "$ANDROID_SDK_ROOT" ]]; then
    echo -e "${RED}❌ ANDROID_HOME or ANDROID_SDK_ROOT is not set${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Android SDK found${NC}\n"

# Navigate to project root
cd "$(dirname "$0")/.."

# Get dependencies
echo -e "${YELLOW}📥 Getting Flutter dependencies...${NC}"
flutter pub get
if [[ $? -ne 0 ]]; then
    echo -e "${RED}❌ Failed to get dependencies${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Dependencies installed${NC}\n"

# List available Android devices/emulators
echo -e "${YELLOW}📋 Checking available Android devices/emulators...${NC}"
flutter devices | grep -i android

# Check if any emulator is running
RUNNING_DEVICE=$(adb devices | grep -v "List" | grep -v "^$" | wc -l)

if [[ $RUNNING_DEVICE -eq 0 ]]; then
    echo -e "\n${YELLOW}⚠️  No Android device/emulator running${NC}"
    
    # List available emulators
    echo -e "${YELLOW}Available emulators:${NC}"
    $ANDROID_HOME/emulator/emulator -list-avds
    
    # Try to start first available emulator
    FIRST_AVD=$($ANDROID_HOME/emulator/emulator -list-avds | head -n 1)
    
    if [[ -n "$FIRST_AVD" ]]; then
        echo -e "${YELLOW}Starting emulator: $FIRST_AVD${NC}"
        $ANDROID_HOME/emulator/emulator -avd "$FIRST_AVD" &
        
        echo -e "${BLUE}Waiting for emulator to boot (this may take 1-2 minutes)...${NC}"
        adb wait-for-device
        echo -e "${GREEN}✓ Emulator started${NC}\n"
    else
        echo -e "${RED}❌ No Android emulator configured${NC}"
        echo -e "${YELLOW}Create one with: Android Studio > AVD Manager${NC}"
        exit 1
    fi
else
    echo -e "${GREEN}✓ Android device/emulator already running${NC}\n"
fi

echo -e "${YELLOW}🚀 Launching QuizTonic on Android...${NC}"
echo -e "${BLUE}This may take a few minutes on first run...${NC}\n"

# Run the app
flutter run -d android
if [[ $? -ne 0 ]]; then
    echo -e "\n${RED}❌ Failed to launch app on Android${NC}"
    exit 1
fi

echo -e "\n${GREEN}========================================${NC}"
echo -e "${GREEN}✅ App launched successfully!${NC}"
echo -e "${GREEN}========================================${NC}\n"

