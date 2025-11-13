#!/bin/bash

# Test Local Web - Build and launch web app locally
# Usage: ./scripts/test_local_web.sh [port]

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default port
PORT=${1:-8080}

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}QuizTonic - Web Local Test${NC}"
echo -e "${BLUE}========================================${NC}\n"

# Check Flutter installation
echo -e "${YELLOW}🌐 Checking Flutter installation...${NC}"
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

echo -e "${YELLOW}🚀 Launching QuizTonic web app on localhost:${PORT}...${NC}"
echo -e "${BLUE}The app will open automatically in your default browser${NC}"
echo -e "${BLUE}Press 'r' to hot reload, 'R' to hot restart, 'q' to quit${NC}\n"

# Run the app
flutter run -d chrome --web-port=$PORT
if [[ $? -ne 0 ]]; then
    echo -e "\n${RED}❌ Failed to launch web app${NC}"
    exit 1
fi

echo -e "\n${GREEN}========================================${NC}"
echo -e "${GREEN}✅ Web app stopped${NC}"
echo -e "${GREEN}========================================${NC}\n"

