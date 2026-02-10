#!/bin/bash

# SPMVV Exam Results - Docker Deployment Script for RHEL/AlmaLinux

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}=========================================="
echo "SPMVV Exam Results - Docker Deployment"
echo -e "==========================================${NC}\n"

# Get server IP
SERVER_IP=$(hostname -I | awk '{print $1}')
if [ -z "$SERVER_IP" ]; then
    SERVER_IP="localhost"
fi

echo -e "${YELLOW}[1/6] Checking Docker installation...${NC}"

# Check if docker is installed
if ! command -v docker &> /dev/null; then
    echo -e "${YELLOW}Docker not found. Installing Docker...${NC}"
    
    # Install Docker on RHEL/AlmaLinux
    yum install -y yum-utils
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
    
    # Start Docker
    systemctl start docker
    systemctl enable docker
    
    echo -e "${GREEN}✓ Docker installed${NC}"
else
    echo -e "${GREEN}✓ Docker already installed${NC}"
fi

# Check Docker Compose
if ! docker compose version &> /dev/null; then
    echo -e "${RED}✗ Docker Compose plugin not found${NC}"
    echo "Installing Docker Compose plugin..."
    yum install -y docker-compose-plugin
fi

echo -e "${GREEN}✓ Docker version: $(docker --version)${NC}"
echo -e "${GREEN}✓ Docker Compose version: $(docker compose version)${NC}\n"

echo -e "${YELLOW}[2/6] Creating .env file for Docker...${NC}"

# Create .env file for docker-compose
cat > .env <<EOF
# Database Configuration
MYSQL_ROOT_PASSWORD=RootPassword@2026
DB_NAME=spmvv_results
DB_USER=spmvv_user
DB_PASSWORD=SpmvvDb@2026

# Django Configuration
SECRET_KEY=django-insecure-docker-$(date +%s)-change-in-production
DEBUG=True
ALLOWED_HOSTS=localhost,127.0.0.1,$SERVER_IP,backend

# Admin User
ADMIN_USERNAME=admin
ADMIN_DEFAULT_PASSWORD=SpmvvExamResults

# JWT Settings
JWT_ACCESS_TOKEN_LIFETIME=60
JWT_REFRESH_TOKEN_LIFETIME=1440

# API URL (for frontend)
VITE_API_URL=http://$SERVER_IP:8000/api
EOF

echo -e "${GREEN}✓ .env file created${NC}\n"

echo -e "${YELLOW}[3/6] Stopping existing containers...${NC}"
docker compose down 2>/dev/null || true
echo -e "${GREEN}✓ Existing containers stopped${NC}\n"

echo -e "${YELLOW}[4/6] Building Docker images...${NC}"
echo "This may take 5-10 minutes on first run..."
docker compose build --no-cache
echo -e "${GREEN}✓ Docker images built${NC}\n"

echo -e "${YELLOW}[5/6] Starting containers...${NC}"
docker compose up -d
echo -e "${GREEN}✓ Containers started${NC}\n"

echo -e "${YELLOW}[6/6] Waiting for services to be ready...${NC}"
sleep 10

# Check if containers are running
if docker ps | grep -q spmvv_backend && docker ps | grep -q spmvv_frontend && docker ps | grep -q spmvv_db; then
    echo -e "${GREEN}✓ All containers are running${NC}\n"
else
    echo -e "${RED}✗ Some containers failed to start${NC}"
    echo "Container status:"
    docker ps -a | grep spmvv
    echo ""
    echo "Check logs with: docker compose logs"
    exit 1
fi

# Configure firewall if running
if systemctl is-active --quiet firewalld; then
    echo -e "${YELLOW}Configuring firewall...${NC}"
    firewall-cmd --permanent --add-port=8000/tcp 2>/dev/null || true
    firewall-cmd --permanent --add-port=2026/tcp 2>/dev/null || true
    firewall-cmd --permanent --add-port=3306/tcp 2>/dev/null || true
    firewall-cmd --reload 2>/dev/null || true
    echo -e "${GREEN}✓ Firewall configured${NC}\n"
fi

echo -e "${GREEN}=========================================="
echo "✓ Deployment completed successfully!"
echo -e "==========================================${NC}\n"

echo -e "${BLUE}Access URLs:${NC}"
echo -e "  Frontend: ${GREEN}http://$SERVER_IP:2026${NC}"
echo -e "  Backend:  ${GREEN}http://$SERVER_IP:8000${NC}"
echo -e "  Database: ${GREEN}localhost:3306${NC}"
echo ""

echo -e "${BLUE}Login Credentials:${NC}"
echo -e "  Username: ${GREEN}admin${NC}"
echo -e "  Password: ${GREEN}SpmvvExamResults${NC}"
echo ""

echo -e "${BLUE}Useful Commands:${NC}"
echo "  View logs:           docker compose logs -f"
echo "  View backend logs:   docker compose logs -f backend"
echo "  View frontend logs:  docker compose logs -f frontend"
echo "  Stop containers:     docker compose down"
echo "  Restart containers:  docker compose restart"
echo "  Check status:        docker compose ps"
echo ""

echo -e "${YELLOW}⚠ IMPORTANT:${NC}"
echo "  1. Change admin password after first login"
echo "  2. Update SECRET_KEY in .env for production"
echo "  3. Set DEBUG=False in .env for production"
echo ""

echo -e "${GREEN}Deployment complete! Access the application at http://$SERVER_IP:2026${NC}"
