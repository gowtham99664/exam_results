#!/bin/bash
set -e
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'
echo -e "${GREEN}SPMVV Exam Results - New Environment Setup${NC}"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"
if [ -f /etc/redhat-release ]; then
    OS="redhat"
elif [ -f /etc/debian_version ]; then
    OS="debian"
else
    echo -e "${RED}Unsupported OS${NC}"
    exit 1
fi
echo -e "\n${YELLOW}Step 1: Installing system dependencies...${NC}"
if [ "$OS" = "redhat" ]; then
    yum install -y python3 python3-pip python3-devel mysql-server mysql-devel gcc nodejs npm git || true
    systemctl enable mysqld && systemctl start mysqld || true
elif [ "$OS" = "debian" ]; then
    apt-get update && apt-get install -y python3 python3-pip python3-dev default-mysql-server default-libmysqlclient-dev build-essential nodejs npm git || true
    systemctl enable mysql && systemctl start mysql || true
fi
echo -e "${GREEN}System dependencies installed!${NC}"
echo -e "\n${YELLOW}Step 2: Setting up Python virtual environment...${NC}"
cd backend
rm -rf venv
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip setuptools wheel
echo -e "${GREEN}Virtual environment created!${NC}"
echo -e "\n${YELLOW}Step 3: Installing Python dependencies...${NC}"
pip install -r requirements.txt
echo -e "${GREEN}Python dependencies installed!${NC}"
echo -e "\n${YELLOW}Step 4: Configuring environment variables...${NC}"
if [ ! -f .env ]; then
    cp .env.example .env
    SECRET_KEY=$(python3 -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())')
    sed -i "s|SECRET_KEY=.*|SECRET_KEY=$SECRET_KEY|g" .env
    SERVER_IP=$(hostname -I | awk '{print $1}')
    sed -i "s|ALLOWED_HOSTS=.*|ALLOWED_HOSTS=$SERVER_IP,localhost,127.0.0.1|g" .env
    echo -e "${GREEN}.env file created${NC}"
fi
echo -e "${GREEN}Environment variables configured!${NC}"
echo -e "\n${YELLOW}Step 5: Running Django migrations...${NC}"
python manage.py makemigrations || true
python manage.py migrate
echo -e "${GREEN}Migrations completed!${NC}"
echo -e "\n${YELLOW}Step 6: Creating admin user...${NC}"
python manage.py init_admin
echo -e "${GREEN}Admin user created!${NC}"
echo -e "\n${YELLOW}Step 7: Collecting static files...${NC}"
python manage.py collectstatic --noinput
echo -e "${GREEN}Static files collected!${NC}"
echo -e "\n${YELLOW}Step 8: Setting up frontend...${NC}"
cd ../frontend
npm install
if [ ! -f .env ]; then
    SERVER_IP=$(hostname -I | awk '{print $1}')
    echo "VITE_API_URL=http://$SERVER_IP:8000" > .env
fi
cd ..
echo -e "${GREEN}Frontend setup completed!${NC}"
SERVER_IP=$(hostname -I | awk '{print $1}')
echo -e "\n${GREEN}Setup Complete!${NC}"
echo -e "${YELLOW}Start with: ./run.sh${NC}"
echo -e "Backend:  http://$SERVER_IP:8000"
echo -e "Frontend: http://$SERVER_IP:2026"
echo -e "Admin: admin / SpmvvExamResults"
echo -e "${RED}CHANGE DEFAULT PASSWORD!${NC}"
