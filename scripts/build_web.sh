#!/bin/bash

# Build Web - Check configuration and build for Web
# Usage: ./scripts/build_web.sh

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}QuizTonic - Web Build Script${NC}"
echo -e "${BLUE}========================================${NC}\n"

# Check Flutter installation
echo -e "${YELLOW}🌐 Checking Flutter installation...${NC}"
if ! command -v flutter &> /dev/null; then
    echo -e "${RED}❌ Flutter is not installed or not in PATH${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Flutter found: $(flutter --version | head -n 1)${NC}\n"

# Check if web is enabled
echo -e "${YELLOW}🔍 Checking if Flutter web is enabled...${NC}"
if ! flutter config | grep -q "enable-web: true"; then
    echo -e "${YELLOW}⚠️  Flutter web is not enabled. Enabling now...${NC}"
    flutter config --enable-web
fi
echo -e "${GREEN}✓ Flutter web is enabled${NC}\n"

# Navigate to project root
cd "$(dirname "$0")/.."

# Check essential web files
echo -e "${YELLOW}📋 Checking web configuration files...${NC}"
if [[ ! -f "web/index.html" ]]; then
    echo -e "${RED}❌ web/index.html not found${NC}"
    exit 1
fi
if [[ ! -f "web/manifest.json" ]]; then
    echo -e "${RED}❌ web/manifest.json not found${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Web configuration files found${NC}\n"

# Check Firebase configuration (optional for web)
echo -e "${YELLOW}🔥 Checking Firebase web configuration...${NC}"
if ! grep -q "apiKey:" web/index.html; then
    echo -e "${YELLOW}⚠️  Firebase config not found in web/index.html${NC}"
    echo -e "${YELLOW}   Add Firebase config from Firebase Console if needed${NC}\n"
else
    echo -e "${GREEN}✓ Firebase configuration found in web/index.html${NC}\n"
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

# Build for Web
echo -e "${YELLOW}🔨 Building web app (Release mode)...${NC}"
flutter build web --release --web-renderer canvaskit
if [[ $? -ne 0 ]]; then
    echo -e "${RED}❌ Web build failed${NC}"
    exit 1
fi

echo -e "\n${GREEN}========================================${NC}"
echo -e "${GREEN}✅ Web Build Successful!${NC}"
echo -e "${GREEN}========================================${NC}"
echo -e "${BLUE}Build location: build/web/${NC}"
echo -e "${YELLOW}Next steps:${NC}"
echo -e "  1. Test locally: ./scripts/test_local_web.sh"
echo -e "  2. Deploy to hosting:"
echo -e "     - Firebase Hosting: firebase deploy --only hosting"
echo -e "     - Netlify: netlify deploy --dir=build/web --prod"
echo -e "     - GitHub Pages: copy build/web/* to gh-pages branch"
echo -e "${GREEN}========================================${NC}\n"

