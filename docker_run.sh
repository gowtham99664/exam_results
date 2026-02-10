#!/bin/bash
PROJECT_DIR="/root/spmvv-exam-results"
cd "$PROJECT_DIR"
echo "=========================================="
echo "SPMVV Exam Results - Docker Deployment"
echo "=========================================="
if [ -f backend/.env ]; then
    set -a
    source backend/.env
    set +a
fi
echo ""
echo "Stopping existing containers..."
podman stop spmvv_db spmvv_backend spmvv_frontend 2>/dev/null || true
podman rm spmvv_db spmvv_backend spmvv_frontend 2>/dev/null || true
echo ""
echo "Creating network..."
podman network create spmvv_network 2>/dev/null || echo "Network already exists"
echo ""
echo "Starting MySQL database..."
podman run -d \
  --name spmvv_db \
  --network spmvv_network \
  -e MYSQL_ROOT_PASSWORD="${MYSQL_ROOT_PASSWORD:-root_password}" \
  -e MYSQL_DATABASE="${DB_NAME:-spmvv_results}" \
  -e MYSQL_USER="${DB_USER:-spmvv_user}" \
  -e MYSQL_PASSWORD="${DB_PASSWORD:-SpmvvDb@2026}" \
  -v spmvv_mysql_data:/var/lib/mysql \
  -p 3307:3306 \
  docker.io/mariadb:10.11
echo "Waiting for database..."
sleep 20
echo ""
echo "Starting backend..."
podman run -d \
  --name spmvv_backend \
  --network spmvv_network \
  -e SECRET_KEY="${SECRET_KEY:-django-insecure-change-this}" \
  -e DEBUG="${DEBUG:-True}" \
  -e ALLOWED_HOSTS="${ALLOWED_HOSTS:-localhost,127.0.0.1}" \
  -e DB_ENGINE="django.db.backends.mysql" \
  -e DB_NAME="${DB_NAME:-spmvv_results}" \
  -e DB_USER="${DB_USER:-spmvv_user}" \
  -e DB_PASSWORD="${DB_PASSWORD:-SpmvvDb@2026}" \
  -e DB_HOST="spmvv_db" \
  -e DB_PORT="3306" \
  -e ADMIN_USERNAME="${ADMIN_USERNAME:-admin}" \
  -e ADMIN_DEFAULT_PASSWORD="${ADMIN_DEFAULT_PASSWORD:-SpmvvExamResults}" \
  -p 8000:8000 \
  localhost/spmvv-backend:latest
echo "Waiting for backend..."
sleep 10
echo ""
echo "Starting frontend..."
podman run -d \
  --name spmvv_frontend \
  --network spmvv_network \
  -e VITE_API_URL="http://localhost:8000" \
  -p 2026:2026 \
  localhost/spmvv-frontend:latest
sleep 5
echo ""
echo "=========================================="
echo "Deployment Complete!"
echo "=========================================="
SERVER_IP=$(hostname -I | awk '{print $1}')
echo ""
echo "Backend:  http://$SERVER_IP:8000"
echo "Frontend: http://$SERVER_IP:2026"
echo ""
echo "Admin: ${ADMIN_USERNAME:-admin} / ${ADMIN_DEFAULT_PASSWORD:-SpmvvExamResults}"
echo ""
podman ps --filter "name=spmvv_" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
echo ""
echo "Logs: podman logs -f spmvv_backend"
echo "Stop: podman stop spmvv_db spmvv_backend spmvv_frontend"
echo ""
