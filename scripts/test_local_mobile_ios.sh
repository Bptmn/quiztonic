#!/bin/bash

# Test Local Mobile iOS - Build and launch on iOS simulator
# Usage: ./scripts/test_local_mobile_ios.sh

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}QuizTonic - iOS Local Test${NC}"
echo -e "${BLUE}========================================${NC}\n"

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo -e "${RED}❌ Error: iOS simulators are only supported on macOS${NC}"
    exit 1
fi

# Check Flutter installation
echo -e "${YELLOW}📱 Checking Flutter installation...${NC}"
if ! command -v flutter &> /dev/null; then
    echo -e "${RED}❌ Flutter is not installed or not in PATH${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Flutter found${NC}\n"

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

# List available iOS simulators
echo -e "${YELLOW}📋 Available iOS simulators:${NC}"
xcrun simctl list devices available | grep -i iphone | head -n 5

# Check if any simulator is running and get its device ID
echo -e "\n${YELLOW}🔍 Checking for running simulators...${NC}"
BOOTED_DEVICE=$(xcrun simctl list devices | grep -i "booted" | grep -i "iphone" | head -n 1)

if [[ -n "$BOOTED_DEVICE" ]]; then
    echo -e "${GREEN}✓ Simulator already running${NC}"
    # Extract device ID from booted simulator line
    DEVICE_ID=$(echo "$BOOTED_DEVICE" | grep -oE '[A-F0-9]{8}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{12}' | head -n 1)
    if [[ -n "$DEVICE_ID" ]]; then
        echo -e "${BLUE}Using booted simulator: $DEVICE_ID${NC}"
        TARGET_DEVICE="$DEVICE_ID"
    fi
fi

# If no booted simulator, find first available iOS simulator
if [[ -z "$TARGET_DEVICE" ]]; then
    echo -e "${YELLOW}⚠️  No simulator running. Finding available iOS simulator...${NC}"
    AVAILABLE_DEVICE=$(xcrun simctl list devices available | grep -i "iphone" | head -n 1)
    
    if [[ -n "$AVAILABLE_DEVICE" ]]; then
        # Extract device ID
        DEVICE_ID=$(echo "$AVAILABLE_DEVICE" | grep -oE '[A-F0-9]{8}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{12}' | head -n 1)
        if [[ -n "$DEVICE_ID" ]]; then
            echo -e "${YELLOW}Starting simulator: $DEVICE_ID${NC}"
            xcrun simctl boot "$DEVICE_ID" 2>/dev/null || true
            open -a Simulator
            sleep 5
            TARGET_DEVICE="$DEVICE_ID"
        fi
    fi
fi

# Fallback: use first iOS simulator from flutter devices
if [[ -z "$TARGET_DEVICE" ]]; then
    echo -e "${YELLOW}⚠️  Using Flutter's device detection...${NC}"
    # Flutter devices format: "Device Name • device-id • platform • details"
    FLUTTER_DEVICE=$(flutter devices 2>/dev/null | grep -i "iphone" | grep -i "simulator" | head -n 1)
    if [[ -n "$FLUTTER_DEVICE" ]]; then
        # Extract device ID (second field, between • markers)
        DEVICE_ID=$(echo "$FLUTTER_DEVICE" | awk -F'•' '{print $2}' | xargs)
        if [[ -n "$DEVICE_ID" ]]; then
            TARGET_DEVICE="$DEVICE_ID"
        else
            # Try extracting device name (first field)
            DEVICE_NAME=$(echo "$FLUTTER_DEVICE" | awk -F'•' '{print $1}' | xargs)
            if [[ -n "$DEVICE_NAME" ]]; then
                TARGET_DEVICE="$DEVICE_NAME"
            fi
        fi
    fi
fi

if [[ -z "$TARGET_DEVICE" ]]; then
    echo -e "${RED}❌ No iOS simulator found. Please start a simulator manually.${NC}"
    exit 1
fi

echo -e "\n${YELLOW}🚀 Launching QuizTonic on iOS simulator ($TARGET_DEVICE)...${NC}"
echo -e "${BLUE}This may take a few minutes on first run...${NC}\n"

# Run the app with specific device ID
flutter run -d "$TARGET_DEVICE"
if [[ $? -ne 0 ]]; then
    echo -e "\n${RED}❌ Failed to launch app on iOS simulator${NC}"
    exit 1
fi

echo -e "\n${GREEN}========================================${NC}"
echo -e "${GREEN}✅ App launched successfully!${NC}"
echo -e "${GREEN}========================================${NC}\n"

