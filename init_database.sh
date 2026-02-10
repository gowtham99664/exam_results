#!/bin/bash
set -e
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'
echo -e "${GREEN}SPMVV Exam Results - Database Initialization${NC}"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR/backend"
if [ ! -f .env ]; then
    echo -e "${RED}Error: .env file not found!${NC}"
    exit 1
fi
set -a
source .env
set +a
echo -e "\n${YELLOW}Please enter MySQL root password:${NC}"
read -s MYSQL_ROOT_PASS
echo -e "\n${YELLOW}Creating database...${NC}"
mysql -u root -p"$MYSQL_ROOT_PASS" <<MYSQL_SCRIPT
CREATE DATABASE IF NOT EXISTS ${DB_NAME:-spmvv_results} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS '${DB_USER:-spmvv_user}'@'localhost' IDENTIFIED BY '${DB_PASSWORD:-changeme}';
GRANT ALL PRIVILEGES ON ${DB_NAME:-spmvv_results}.* TO '${DB_USER:-spmvv_user}'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT
echo -e "${GREEN}Database created!${NC}"
echo -e "\n${YELLOW}Running Django migrations...${NC}"
if [ -d venv ]; then
    source venv/bin/activate
fi
python manage.py makemigrations || true
python manage.py migrate
echo -e "${GREEN}Migrations completed!${NC}"
echo -e "\n${YELLOW}Creating admin user...${NC}"
python manage.py init_admin
echo -e "\n${GREEN}Database initialization complete!${NC}"
echo "Admin: ${ADMIN_USERNAME:-admin} / ${ADMIN_DEFAULT_PASSWORD:-SpmvvExamResults}"
echo -e "${RED}CHANGE DEFAULT PASSWORD!${NC}"
