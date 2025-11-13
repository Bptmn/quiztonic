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

# Check if any simulator is running
echo -e "\n${YELLOW}🔍 Checking for running simulators...${NC}"
RUNNING_SIMULATOR=$(xcrun simctl list devices | grep -i "booted" | head -n 1)

if [[ -z "$RUNNING_SIMULATOR" ]]; then
    echo -e "${YELLOW}⚠️  No simulator running. Starting default iPhone simulator...${NC}"
    # Open simulator
    open -a Simulator
    # Wait for simulator to boot
    sleep 5
else
    echo -e "${GREEN}✓ Simulator already running${NC}"
fi

echo -e "\n${YELLOW}🚀 Launching QuizTonic on iOS simulator...${NC}"
echo -e "${BLUE}This may take a few minutes on first run...${NC}\n"

# Run the app
flutter run -d ios
if [[ $? -ne 0 ]]; then
    echo -e "\n${RED}❌ Failed to launch app on iOS simulator${NC}"
    exit 1
fi

echo -e "\n${GREEN}========================================${NC}"
echo -e "${GREEN}✅ App launched successfully!${NC}"
echo -e "${GREEN}========================================${NC}\n"

