#!/bin/bash

# SPMVV Exam Results - Fresh Server Setup Script
# This script automates the complete setup on a fresh RHEL/CentOS server

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
DB_NAME="spmvv_results"
DB_USER="spmvv_user"
DB_PASSWORD="SpmvvDb@2026"
ADMIN_USERNAME="admin"
ADMIN_PASSWORD="SpmvvExamResults"

echo -e "${BLUE}=========================================="
echo "SPMVV Exam Results - Fresh Server Setup"
echo -e "==========================================${NC}\n"

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo -e "${RED}Please run as root (sudo su)${NC}"
    exit 1
fi

# Detect OS
if [ -f /etc/redhat-release ]; then
    OS="redhat"
    PKG_MANAGER="yum"
elif [ -f /etc/debian_version ]; then
    OS="debian"
    PKG_MANAGER="apt"
else
    echo -e "${RED}Unsupported OS. This script supports RHEL/CentOS/Ubuntu/Debian only.${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Detected OS: $OS${NC}\n"

# Step 1: Install system packages
echo -e "${YELLOW}[1/7] Installing system packages...${NC}"
if [ "$OS" = "redhat" ]; then
    # Detect RHEL version
    RHEL_VERSION=$(cat /etc/redhat-release | grep -oP '\d+' | head -1)
    echo -e "${BLUE}Detected RHEL version: $RHEL_VERSION${NC}"
    
    if [ "$RHEL_VERSION" -ge 10 ]; then
        # RHEL 10+ uses MariaDB instead of MySQL
        echo -e "${BLUE}Installing for RHEL 10+...${NC}"
        yum install -y python3 python3-pip python3-devel \
                       mariadb-server mariadb-connector-c-devel \
                       gcc git
        
        # Install Node.js from NodeSource (RHEL 10 default nodejs might be old)
        echo -e "${BLUE}Installing Node.js 18 LTS...${NC}"
        curl -sL https://rpm.nodesource.com/setup_18.x | bash -
        yum install -y nodejs
        DB_SERVICE="mariadb"
    elif [ "$RHEL_VERSION" -ge 8 ]; then
        # RHEL 8-9 also prefer MariaDB
        echo -e "${BLUE}Installing for RHEL 8/9...${NC}"
        yum install -y python3 python3-pip python3-devel \
                       mariadb-server mariadb-connector-c-devel \
                       gcc nodejs npm git
        DB_SERVICE="mariadb"
    else
        # RHEL 7 uses MySQL
        echo -e "${BLUE}Installing for RHEL 7...${NC}"
        yum install -y python3 python3-pip python3-devel \
                       mysql-server mysql-devel \
                       gcc nodejs npm git
        DB_SERVICE="mysqld"
    fi
else
    apt update
    apt install -y python3 python3-pip python3-dev \
                   mysql-server libmysqlclient-dev \
                   gcc nodejs npm git
    DB_SERVICE="mysql"
fi
echo -e "${GREEN}✓ System packages installed${NC}\n"

# Step 2: Start MySQL/MariaDB
echo -e "${YELLOW}[2/7] Starting database service ($DB_SERVICE)...${NC}"
systemctl enable $DB_SERVICE
systemctl start $DB_SERVICE

# Wait for database to be ready
sleep 5

# Verify database service is running
if systemctl is-active --quiet $DB_SERVICE; then
    echo -e "${GREEN}✓ Database service ($DB_SERVICE) started${NC}\n"
else
    echo -e "${RED}✗ Database service failed to start${NC}"
    echo "Check logs: journalctl -xe -u $DB_SERVICE"
    exit 1
fi

# Step 3: Create database and user
echo -e "${YELLOW}[3/7] Creating database and user...${NC}"

# Check if MySQL root password is set
MYSQL_ROOT_PWD=""
if mysql -u root -e "SELECT 1" &>/dev/null; then
    echo "MySQL root has no password (fresh install)"
    MYSQL_ROOT_PWD=""
else
    echo -e "${BLUE}Enter MySQL root password (press Enter if none):${NC}"
    read -s MYSQL_ROOT_PWD
fi

# Create database and user
if [ -z "$MYSQL_ROOT_PWD" ]; then
    mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
EOF
else
    mysql -u root -p"$MYSQL_ROOT_PWD" <<EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
EOF
fi

echo -e "${GREEN}✓ Database '$DB_NAME' and user '$DB_USER' created${NC}\n"

# Verify database connection
if mysql -u "$DB_USER" -p"$DB_PASSWORD" -e "USE $DB_NAME" &>/dev/null; then
    echo -e "${GREEN}✓ Database connection verified${NC}\n"
else
    echo -e "${RED}✗ Failed to connect to database${NC}"
    exit 1
fi

# Step 4: Configure backend .env
echo -e "${YELLOW}[4/7] Configuring backend environment...${NC}"

cd "$(dirname "$0")/backend" || exit 1

# Create .env file
cat > .env <<EOF
# Django Secret Key - Generate a new one for production!
# Run: python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())'
SECRET_KEY=django-insecure-change-this-in-production-$(date +%s)

# Debug mode - Set to False in production
DEBUG=True

# Allowed hosts - Add your domain/IP
ALLOWED_HOSTS=localhost,127.0.0.1,$(hostname -I | awk '{print $1}')

# Database Configuration
DB_NAME=$DB_NAME
DB_USER=$DB_USER
DB_PASSWORD=$DB_PASSWORD
DB_HOST=localhost
DB_PORT=3306

# Admin User Configuration
ADMIN_USERNAME=$ADMIN_USERNAME
ADMIN_DEFAULT_PASSWORD=$ADMIN_PASSWORD

# CORS Settings (for development)
CORS_ALLOWED_ORIGINS=http://localhost:2026,http://127.0.0.1:2026,http://$(hostname -I | awk '{print $1}'):2026
EOF

echo -e "${GREEN}✓ Backend .env file created${NC}\n"

# Step 5: Setup Python virtual environment and run migrations
echo -e "${YELLOW}[5/7] Setting up Python virtual environment...${NC}"

if [ ! -d "venv" ]; then
    python3 -m venv venv
    echo -e "${GREEN}✓ Virtual environment created${NC}"
fi

source venv/bin/activate
echo -e "${GREEN}✓ Virtual environment activated${NC}\n"

echo -e "${YELLOW}[5/7] Installing Python dependencies...${NC}"
pip install --upgrade pip setuptools wheel
pip install -r requirements.txt
echo -e "${GREEN}✓ Python dependencies installed${NC}\n"

echo -e "${YELLOW}[5/7] Running database migrations...${NC}"
python manage.py migrate
echo -e "${GREEN}✓ Database migrations completed${NC}\n"

echo -e "${YELLOW}[5/7] Creating admin user...${NC}"
python manage.py init_admin
echo -e "${GREEN}✓ Admin user created${NC}\n"

echo -e "${YELLOW}[5/7] Collecting static files...${NC}"
python manage.py collectstatic --noinput
echo -e "${GREEN}✓ Static files collected${NC}\n"

deactivate

# Step 6: Configure frontend
echo -e "${YELLOW}[6/7] Configuring frontend environment...${NC}"

cd ../frontend || exit 1

echo -e "${YELLOW}[6/7] Installing npm dependencies (this may take a few minutes)...${NC}"
npm install
echo -e "${GREEN}✓ Frontend dependencies installed${NC}\n"

# Create frontend .env
SERVER_IP=$(hostname -I | awk '{print $1}')
if [ -z "$SERVER_IP" ]; then
    SERVER_IP="localhost"
fi

cat > .env <<EOF
VITE_API_URL=http://$SERVER_IP:8000/api
EOF

echo -e "${GREEN}✓ Frontend .env file created${NC}\n"

# Step 7: Configure firewall (if firewalld is running)
echo -e "${YELLOW}[7/7] Configuring firewall...${NC}"

if systemctl is-active --quiet firewalld; then
    firewall-cmd --permanent --add-port=8000/tcp
    firewall-cmd --permanent --add-port=2026/tcp
    firewall-cmd --reload
    echo -e "${GREEN}✓ Firewall configured (ports 8000, 2026 opened)${NC}\n"
else
    echo -e "${YELLOW}⚠ Firewalld not running - skipping firewall configuration${NC}\n"
fi

# Final message
cd ..
echo -e "${GREEN}=========================================="
echo "✓ Setup completed successfully!"
echo -e "==========================================${NC}\n"

echo -e "${BLUE}Configuration Summary:${NC}"
echo "  Database: $DB_NAME"
echo "  DB User: $DB_USER"
echo "  DB Password: $DB_PASSWORD"
echo "  Admin Username: $ADMIN_USERNAME"
echo "  Admin Password: $ADMIN_PASSWORD"
echo "  Server IP: $SERVER_IP"
echo ""

echo -e "${BLUE}Next Steps:${NC}"
echo "  1. Start the application:"
echo -e "     ${GREEN}./run.sh${NC}"
echo ""
echo "  2. Access the application:"
echo -e "     Fron
