# SPMVV Exam Results - Docker Deployment Guide

## Quick Start - One Command Deployment

```bash
ssh root@10.127.248.83
cd /root/spmvv-exam-results
./docker_deploy.sh
```

**That's it!** The script will:
1. ✅ Install Docker if not present
2. ✅ Create .env configuration
3. ✅ Build Docker images
4. ✅ Start all containers (Database, Backend, Frontend)
5. ✅ Configure firewall
6. ✅ Run migrations and create admin user

**Deployment time:** 5-10 minutes (first time)

---

## What Gets Deployed

### 3 Docker Containers:

1. **spmvv_db** - MariaDB 10.11 database
   - Port: 3306
   - Data persisted in Docker volume

2. **spmvv_backend** - Django REST API
   - Port: 8000
   - Python 3.11 + Gunicorn
   - Auto-runs migrations
   - Auto-creates admin user

3. **spmvv_frontend** - React + Vite
   - Port: 2026
   - Node.js 18

---

## Access the Application

**Frontend URL:** `http://YOUR_SERVER_IP:2026`  
**Backend API:** `http://YOUR_SERVER_IP:8000`

**Login Credentials:**
- Username: `admin`
- Password: `SpmvvExamResults`

---

## Docker Management Commands

### View Running Containers
```bash
cd /root/spmvv-exam-results
docker compose ps
```

### View Logs
```bash
# All logs
docker compose logs -f

# Backend logs only
docker compose logs -f backend

# Frontend logs only
docker compose logs -f frontend

# Database logs only
docker compose logs -f db
```

### Stop Application
```bash
docker compose down
```

### Start Application
```bash
docker compose up -d
```

### Restart Application
```bash
docker compose restart
```

### Rebuild and Restart (after code changes)
```bash
docker compose down
docker compose build --no-cache
docker compose up -d
```

### Check Container Status
```bash
docker compose ps
docker ps
```

### Access Container Shell
```bash
# Backend container
docker exec -it spmvv_backend bash

# Frontend container
docker exec -it spmvv_frontend sh

# Database container
docker exec -it spmvv_db bash
```

---

## Database Management

### Backup Database
```bash
docker exec spmvv_db mysqldump -u spmvv_user -pSpmvvDb@2026 spmvv_results > backup_$(date +%Y%m%d).sql
```

### Restore Database
```bash
docker exec -i spmvv_db mysql -u spmvv_user -pSpmvvDb@2026 spmvv_results < backup_20260210.sql
```

### Access MySQL Console
```bash
docker exec -it spmvv_db mysql -u spmvv_user -pSpmvvDb@2026 spmvv_results
```

---

## Troubleshooting

### Issue: Containers won't start

**Check logs:**
```bash
docker compose logs
```

**Check individual service:**
```bash
docker compose logs backend
docker compose logs frontend
docker compose logs db
```

### Issue: Port already in use

**Find process using port:**
```bash
netstat -tlnp | grep 8000
netstat -tlnp | grep 2026
```

**Kill process:**
```bash
kill -9 <PID>
```

**Or stop existing containers:**
```bash
docker compose down
```

### Issue: Login not working

**Check frontend .env was created correctly:**
```bash
docker compose logs frontend | grep VITE_API_URL
```

**Verify backend is accessible:**
```bash
curl http://localhost:8000/api/
```

**Check CORS settings:**
```bash
docker compose logs backend | grep CORS
```

### Issue: Database connection error

**Check database is healthy:**
```bash
docker compose ps
```

Should show `healthy` status for db

**Check backend can reach database:**
```bash
docker exec spmvv_backend python manage.py dbshell
```

### Issue: Out of disk space

**Check Docker disk usage:**
```bash
docker system df
```

**Clean up unused images/containers:**
```bash
docker system prune -a
```

---

## Configuration

### Environment Variables

Located in: `/root/spmvv-exam-results/.env`

**Key variables:**
```bash
# Database
DB_NAME=spmvv_results
DB_USER=spmvv_user
DB_PASSWORD=SpmvvDb@2026

# Django
SECRET_KEY=your-secret-key
DEBUG=True
ALLOWED_HOSTS=localhost,127.0.0.1,your.ip

# Admin
ADMIN_USERNAME=admin
ADMIN_DEFAULT_PASSWORD=SpmvvExamResults

# Frontend API URL
VITE_API_URL=http://YOUR_IP:8000/api
```

**After changing .env:**
```bash
docker compose down
docker compose up -d
```

---

## Updating the Application

### Update Code
```bash
cd /root/spmvv-exam-results
git pull  # or upload new code

# Rebuild and restart
docker compose down
docker compose build --no-cache
docker compose up -d
```

### Update Dependencies

**Backend (Python packages):**
```bash
# Update backend/requirements.txt
docker compose build backend --no-cache
docker compose up -d
```

**Frontend (npm packages):**
```bash
# Update frontend/package.json
docker compose build frontend --no-cache
docker compose up -d
```

---

## Production Recommendations

1. **Change default passwords:**
   ```bash
   nano /root/spmvv-exam-results/.env
   # Change DB_PASSWORD, ADMIN_DEFAULT_PASSWORD
   docker compose down && docker compose up -d
   ```

2. **Generate new SECRET_KEY:**
   ```bash
   docker exec spmvv_backend python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())'
   # Copy output to .env
   ```

3. **Set DEBUG=False for production:**
   ```bash
   nano /root/spmvv-exam-results/.env
   # Set DEBUG=False
   docker compose restart backend
   ```

4. **Setup SSL/HTTPS:**
   - Use Nginx reverse proxy
   - Get SSL certificate from Let's Encrypt
   - Update VITE_API_URL to use https://

5. **Setup automatic backups:**
   ```bash
   # Add to crontab
   0 2 * * * docker exec spmvv_db mysqldump -u spmvv_user -pSpmvvDb@2026 spmvv_results > /root/backups/spmvv_$(date +\%Y\%m\%d).sql
   ```

6. **Monitor logs:**
   ```bash
   # Setup log rotation
   docker compose logs --tail=1000 > /var/log/spmvv-app.log
   ```

---

## Uninstall / Clean Up

### Remove containers and volumes
```bash
cd /root/spmvv-exam-results
docker compose down -v
```

### Remove images
```bash
docker rmi spmvv-exam-results-backend spmvv-exam-results-frontend
docker rmi mariadb:10.11
```

### Complete cleanup
```bash
docker compose down -v
docker system prune -a --volumes
```

---

## System Requirements

- Docker Engine 20.10+
- Docker Compose plugin v2.0+
- 2GB RAM minimum
- 10GB disk space
- Ports 8000, 2026, 3306 available

---

## Quick Command Reference

```bash
# Deploy
./docker_deploy.sh

# Status
docker compose ps

# Logs
docker compose logs -f

# Stop
docker compose down

# Start
docker compose up -d

# Restart
docker compose restart

# Rebuild
docker compose build --no-cache && docker compose up -d

# Backup DB
docker exec spmvv_db mysqldump -u spmvv_user -pSpmvvDb@2026 spmvv_results > backup.sql

# Access shell
docker exec -it spmvv_backend bash
```

---

## Support

**Check logs first:**
```bash
docker compose logs -f
```

**Check container health:**
```bash
docker compose ps
docker inspect spmvv_backend
```

**Test connectivity:**
```bash
curl http://localhost:8000/api/
curl http://localhost:2026/
```

---

**For any issues, check the logs and container status first. Most problems are related to configuration in the .env file.**
