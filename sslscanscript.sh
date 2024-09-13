#!/bin/bash

# Constants
TARGET_IP="<ip>"
PORTS=(<choose ports example: 443 80 587>)  # List of ports to scan

# Color 
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # <-- No Color

echo -e "${CYAN}Starting SSL scan on $TARGET_IP...${NC}"

for PORT in "${PORTS[@]}"; do
  echo -e "${YELLOW}Scanning $TARGET_IP:$PORT...${NC}"
  
  # Run the sslscan and get output
  sslscan --no-failed "$TARGET_IP:$PORT"
  
  # Check if the sslscan command was successful
  if [ $? -eq 0 ]; then
    echo -e "${GREEN}Scan completed for port $PORT.${NC}"
  else
    echo -e "${RED}Failed to scan $TARGET_IP:$PORT.${NC}"
  fi
  
  echo "------------------------"
done

echo -e "${CYAN}SSL scan completed for all ports.${NC}"
