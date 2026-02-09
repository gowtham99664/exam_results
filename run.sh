#!/bin/bash

# SPMVV Exam Results - Simple Run Script
# This script stops previous services, backs up database, and starts the application

PROJECT_DIR="/root/spmvv-exam-results"
BACKUP_DIR="$PROJECT_DIR/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

echo "=========================================="
echo "SPMVV Exam Results - Startup Script"
echo "=========================================="

# Create backup directory if not exists
mkdir -p "$BACKUP_DIR"

# Step 1: Stop previous running services
echo ""
echo "[1/5] Stopping previous services..."
pkill -f "manage.py runserver"
pkill -f "vite"
sleep 2
echo "✓ Services stopped"

# Step 2: Backup database
echo ""
echo "[2/5] Backing up database..."
mysqldump -u spmvv_user -pSpmvvDb@2026 spmvv_results > "$BACKUP_DIR/spmvv_results_$TIMESTAMP.sql"
if [ $? -eq 0 ]; then
    echo "✓ Database backed up to: $BACKUP_DIR/spmvv_results_$TIMESTAMP.sql"
else
    echo "✗ Database backup failed!"
    exit 1
fi

# Step 3: Start Backend
echo ""
echo "[3/5] Starting Django backend..."
cd "$PROJECT_DIR/backend"
python3 manage.py runserver 0.0.0.0:8000 > /tmp/django.log 2>&1 &
sleep 3

# Check if backend started
if pgrep -f "manage.py runserver" > /dev/null; then
    echo "✓ Backend started on port 8000"
else
    echo "✗ Backend failed to start. Check /tmp/django.log"
    cat /tmp/django.log
    exit 1
fi

# Step 4: Start Frontend
echo ""
echo "[4/5] Starting React frontend..."
cd "$PROJECT_DIR/frontend"
npm run dev -- --host 0.0.0.0 --port 2026 > /tmp/vite.log 2>&1 &
sleep 3

# Check if frontend started
if pgrep -f "vite" > /dev/null; then
    echo "✓ Frontend started on port 2026"
else
    echo "✗ Frontend failed to start. Check /tmp/vite.log"
    cat /tmp/vite.log
    exit 1
fi

# Step 5: Show status
echo ""
echo "[5/5] Application Status:"
echo "=========================================="
echo "Backend:  http://10.127.248.83:8000"
echo "Frontend: http://10.127.248.83:2026"
echo "Backend Log:  /tmp/django.log"
echo "Frontend Log: /tmp/vite.log"
echo "Database Backup: $BACKUP_DIR/spmvv_results_$TIMESTAMP.sql"
echo "=========================================="
echo ""
echo "✓ Application is running!"
echo ""
echo "To stop the application, run:"
echo "  pkill -f 'manage.py runserver' && pkill -f 'vite'"
echo ""
echo "To restore database backup, run:"
echo "  mysql -u spmvv_user -pSpmvvDb@2026 spmvv_results < $BACKUP_DIR/spmvv_results_$TIMESTAMP.sql"
echo ""
