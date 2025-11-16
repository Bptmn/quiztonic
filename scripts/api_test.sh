#!/bin/bash

# API Test - Check health of QuizTonic API
# Usage: ./scripts/api_test.sh [api_url]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default API URL (production)
API_URL=${1:-"https://l6uy5fycohzcps4cqznn5jbdhu0jxsax.lambda-url.eu-west-3.on.aws/"}

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}QuizTonic - API Health Check${NC}"
echo -e "${BLUE}========================================${NC}\n"

echo -e "${YELLOW}🔗 API URL: ${API_URL}${NC}\n"

# Check if curl is installed
if ! command -v curl &> /dev/null; then
    echo -e "${RED}❌ curl is not installed${NC}"
    exit 1
fi

# Test 1: Basic connectivity
echo -e "${YELLOW}🌐 Test 1: Checking basic connectivity...${NC}"
if curl --output /dev/null --silent --head --fail --max-time 10 "$API_URL"; then
    echo -e "${GREEN}✓ API is reachable${NC}\n"
else
    echo -e "${RED}❌ Cannot reach API${NC}"
    echo -e "${YELLOW}Please check:${NC}"
    echo -e "  1. Internet connection"
    echo -e "  2. API URL is correct"
    echo -e "  3. API service is running\n"
    exit 1
fi

# Test 2: GET request (health check)
echo -e "${YELLOW}🏥 Test 2: GET request (health check)...${NC}"
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "$API_URL")

if [[ "$RESPONSE" == "200" ]] || [[ "$RESPONSE" == "405" ]]; then
    echo -e "${GREEN}✓ API responded (HTTP $RESPONSE)${NC}"
    if [[ "$RESPONSE" == "405" ]]; then
        echo -e "${BLUE}  Note: 405 is expected for GET requests (API accepts POST only)${NC}"
    fi
else
    echo -e "${YELLOW}⚠️  API responded with HTTP $RESPONSE${NC}"
fi
echo ""

# Test 3: POST request with sample data
echo -e "${YELLOW}📝 Test 3: POST request with sample quiz generation...${NC}"

# Create sample request
SAMPLE_REQUEST='{
  "data": {
    "text_content": "The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower. Constructed from 1887 to 1889, it was initially criticized but has become a global cultural icon of France.",
    "num_questions": 2,
    "num_choices": 3,
    "generate_flashcards": false
  }
}'

# Make request and capture response
RESPONSE=$(curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d "$SAMPLE_REQUEST" \
  -w "\nHTTP_STATUS:%{http_code}" \
  --max-time 60)

# Extract HTTP status
HTTP_STATUS=$(echo "$RESPONSE" | grep "HTTP_STATUS" | cut -d':' -f2)
BODY=$(echo "$RESPONSE" | sed '/HTTP_STATUS/d')

if [[ "$HTTP_STATUS" == "200" ]]; then
    echo -e "${GREEN}✓ API generated quiz successfully (HTTP 200)${NC}"
    
    # Check if response contains expected fields
    if echo "$BODY" | grep -q "questionCards"; then
        echo -e "${GREEN}✓ Response contains questionCards${NC}"
    fi
    if echo "$BODY" | grep -q "quizName"; then
        echo -e "${GREEN}✓ Response contains quizName${NC}"
    fi
    
    # Show quiz name if available
    QUIZ_NAME=$(echo "$BODY" | grep -o '"quizName":"[^"]*"' | cut -d'"' -f4)
    if [[ -n "$QUIZ_NAME" ]]; then
        echo -e "${BLUE}  Generated quiz: ${QUIZ_NAME}${NC}"
    fi
    
elif [[ "$HTTP_STATUS" == "400" ]]; then
    echo -e "${YELLOW}⚠️  Bad request (HTTP 400)${NC}"
    echo -e "${YELLOW}  Response: ${BODY:0:200}${NC}"
elif [[ "$HTTP_STATUS" == "422" ]]; then
    echo -e "${YELLOW}⚠️  Unprocessable entity (HTTP 422)${NC}"
    echo -e "${YELLOW}  Response: ${BODY:0:200}${NC}"
elif [[ "$HTTP_STATUS" == "500" ]]; then
    echo -e "${RED}❌ Internal server error (HTTP 500)${NC}"
    echo -e "${RED}  Response: ${BODY:0:200}${NC}"
else
    echo -e "${RED}❌ Unexpected response (HTTP $HTTP_STATUS)${NC}"
    echo -e "${RED}  Response: ${BODY:0:200}${NC}"
fi
echo ""

# Test 4: Response time check
echo -e "${YELLOW}⏱️  Test 4: Checking response time...${NC}"
START_TIME=$(date +%s%N)
curl -s -o /dev/null -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d "$SAMPLE_REQUEST" \
  --max-time 60
END_TIME=$(date +%s%N)
ELAPSED=$((($END_TIME - $START_TIME) / 1000000))

echo -e "${BLUE}Response time: ${ELAPSED}ms${NC}"
if [[ $ELAPSED -lt 5000 ]]; then
    echo -e "${GREEN}✓ Response time is good (<5s)${NC}"
elif [[ $ELAPSED -lt 15000 ]]; then
    echo -e "${YELLOW}⚠️  Response time is acceptable (5-15s)${NC}"
else
    echo -e "${YELLOW}⚠️  Response time is slow (>15s)${NC}"
fi
echo ""

# Summary
echo -e "${BLUE}========================================${NC}"
if [[ "$HTTP_STATUS" == "200" ]]; then
    echo -e "${GREEN}✅ API Health Check: PASSED${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}The QuizTonic API is operational${NC}"
else
    echo -e "${YELLOW}⚠️  API Health Check: WARNING${NC}"
    echo -e "${YELLOW}========================================${NC}"
    echo -e "${YELLOW}The API is reachable but may have issues${NC}"
fi

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}API Documentation:${NC}"
echo -e "  ${BLUE}https://github.com/Bptmn/quiztonic_api${NC}"
echo -e "${BLUE}========================================${NC}\n"

