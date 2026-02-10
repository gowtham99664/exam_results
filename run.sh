#!/bin/bash

# SPMVV Exam Results - Enhanced Startup Script with Prerequisites Check

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$PROJECT_DIR/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "=========================================="
echo "SPMVV Exam Results - Startup Script"
echo "=========================================="

# Check prerequisites
echo ""
echo "[0/8] Checking prerequisites..."

PREREQ_FAILED=0

# Check Python
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}✗ Python3 not found${NC}"
    echo "  Install: yum install -y python3"
    PREREQ_FAILED=1
else
    echo -e "${GREEN}✓ Python3: $(python3 --version | awk '{print $2}')${NC}"
fi

# Check Node.js
if ! command -v node &> /dev/null; then
    echo -e "${RED}✗ Node.js not found${NC}"
    echo "  Install: yum install -y nodejs"
    PREREQ_FAILED=1
else
    echo -e "${GREEN}✓ Node.js: $(node --version)${NC}"
fi

# Check npm
if ! command -v npm &> /dev/null; then
    echo -e "${RED}✗ npm not found${NC}"
    echo "  Install: yum install -y npm"
    PREREQ_FAILED=1
else
    echo -e "${GREEN}✓ npm: $(npm --version)${NC}"
fi

# Check MySQL
if ! command -v mysql &> /dev/null; then
    echo -e "${YELLOW}⚠ MySQL client not found (optional for backup)${NC}"
else
    echo -e "${GREEN}✓ MySQL client installed${NC}"
fi

# Check if backend directory exists
if [ ! -d "$PROJECT_DIR/backend" ]; then
    echo -e "${RED}✗ Backend directory not found${NC}"
    PREREQ_FAILED=1
else
    echo -e "${GREEN}✓ Backend directory found${NC}"
fi

# Check if frontend directory exists
if [ ! -d "$PROJECT_DIR/frontend" ]; then
    echo -e "${RED}✗ Frontend directory not found${NC}"
    PREREQ_FAILED=1
else
    echo -e "${GREEN}✓ Frontend directory found${NC}"
fi

# Check if virtual environment exists
if [ ! -d "$PROJECT_DIR/backend/venv" ]; then
    echo -e "${YELLOW}⚠ Python virtual environment not found${NC}"
    echo "  Run first: cd backend && python3 -m venv venv && source venv/bin/activate && pip install -r requirements.txt"
    PREREQ_FAILED=1
else
    echo -e "${GREEN}✓ Python virtual environment exists${NC}"
fi

if [ $PREREQ_FAILED -eq 1 ]; then
    echo ""
    echo -e "${RED}Prerequisites check failed!${NC}"
    echo ""
    echo "Please run the setup script first:"
    echo "  ./setup_new_environment.sh"
    echo ""
    echo "Or manually install missing dependencies:"
    echo "  yum install -y python3 python3-pip nodejs npm mysql-server"
    echo ""
    exit 1
fi

mkdir -p "$BACKUP_DIR"

echo ""
echo "[1/8] Stopping previous services..."
pkill -f "manage.py runserver" 2>/dev/null
pkill -f "vite" 2>/dev/null
sleep 2
echo "✓ Services stopped"

echo ""
echo "[2/8] Backing up database..."
if command -v mysql &> /dev/null && command -v mysqldump &> /dev/null; then
    # Check if database exists and has tables
    TABLE_COUNT=$(mysql -u spmvv_user -pSpmvvDb@2026 -e "USE spmvv_results; SHOW TABLES;" 2>/dev/null | wc -l)
    
    if [ $? -eq 0 ] && [ "$TABLE_COUNT" -gt 1 ]; then
        # Database exists and has tables (subtract 1 for header row)
        mysqldump -u spmvv_user -pSpmvvDb@2026 spmvv_results > "$BACKUP_DIR/spmvv_results_$TIMESTAMP.sql" 2>/dev/null
        if [ $? -eq 0 ]; then
            echo "✓ Database backed up to: $BACKUP_DIR/spmvv_results_$TIMESTAMP.sql"
        else
            echo "⚠ Database backup failed"
        fi
    else
        echo "⚠ Database backup skipped (database not yet initialized or empty)"
    fi
else
    echo "⚠ Database backup skipped (MySQL client/mysqldump not available)"
fi

echo ""
echo "[3/8] Activating Python virtual environment..."
cd "$PROJECT_DIR/backend"
if [ -f venv/bin/activate ]; then
    source venv/bin/activate
    echo "✓ Virtual environment activated"
else
    echo -e "${RED}✗ Virtual environment not found${NC}"
    echo "Creating virtual environment..."
    python3 -m venv venv
    source venv/bin/activate
    pip install --upgrade pip setuptools wheel
    pip install -r requirements.txt
    echo "✓ Virtual environment created and dependencies installed"
fi

echo ""
echo "[4/8] Checking backend dependencies..."
if ! python -c "import django" 2>/dev/null; then
    echo "Installing Python dependencies..."
    pip install -r requirements.txt
    echo "✓ Dependencies installed"
else
    echo "✓ Dependencies OK"
fi

echo ""
echo "[5/8] Configuring frontend environment..."
cd "$PROJECT_DIR/frontend"
if [ ! -d "node_modules" ] || [ ! -f "node_modules/.bin/vite" ]; then
    echo "Installing npm dependencies..."
    npm install
    echo "✓ Frontend dependencies installed"
else
    echo "✓ Frontend dependencies OK"
fi

SERVER_IP=$(hostname -I | awk '{print $1}')
if [ -z "$SERVER_IP" ]; then
    SERVER_IP="localhost"
fi
echo "VITE_API_URL=http://$SERVER_IP:8000/api" > .env
echo "✓ Frontend .env configured with IP: $SERVER_IP"

echo ""
echo "[6/8] Starting Django backend..."
cd "$PROJECT_DIR/backend"
python manage.py runserver 0.0.0.0:8000 > /tmp/django.log 2>&1 &
sleep 3

if pgrep -f "manage.py runserver" > /dev/null; then
    echo "✓ Backend started on port 8000"
else
    echo -e "${RED}✗ Backend failed to start${NC}"
    echo "Last 20 lines of log:"
    tail -20 /tmp/django.log
    exit 1
fi

echo ""
echo "[7/8] Starting React frontend..."
cd "$PROJECT_DIR/frontend"
npm run dev -- --host 0.0.0.0 --port 2026 > /tmp/vite.log 2>&1 &
sleep 3

if pgrep -f "vite" > /dev/null; then
    echo "✓ Frontend started on port 2026"
else
    echo -e "${RED}✗ Frontend failed to start${NC}"
    echo "Last 20 lines of log:"
    tail -20 /tmp/vite.log
    exit 1
fi

echo ""
echo "[8/8] Application Status:"
echo "=========================================="
echo -e "${GREEN}✓ Application is running!${NC}"
echo ""
echo "Access URLs:"
echo "  Frontend: http://$SERVER_IP:2026"
echo "  Backend:  http://$SERVER_IP:8000"
echo ""
echo "Login Credentials:"
echo "  Username: admin"
echo "  Password: SpmvvExamResults"
echo ""
echo -e "${YELLOW}⚠ IMPORTANT: Change the default password after first login!${NC}"
echo ""
echo "Logs:"
echo "  Backend:  /tmp/django.log"
echo "  Frontend: /tmp/vite.log"
echo ""
echo "To stop the application:"
echo "  pkill -f 'manage.py runserver' && pkill -f 'vite'"
echo "=========================================="
echo ""
