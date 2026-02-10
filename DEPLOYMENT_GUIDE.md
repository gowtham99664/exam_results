# SPMVV Exam Results - Fresh Server Deployment Guide

## Overview

This guide walks you through deploying the SPMVV Exam Results application on a fresh RHEL/CentOS/Rocky Linux server from scratch.

**Estimated Time:** 15-20 minutes

**Requirements:**
- Fresh RHEL/CentOS/Rocky Linux 7+ server
- Root or sudo access
- Internet connection

---

## Quick Start (Automated)

If you prefer automated setup, use the provided script:

```bash
# Make script executable
chmod +x setup_fresh_server.sh

# Run the setup script
sudo ./setup_fresh_server.sh

# Start the application
./run.sh
```

That's it! The script handles everything automatically.

---

## Manual Step-by-Step Guide

If you prefer to understand each step or need to troubleshoot, follow this detailed guide.

---

### Step 1: Install System Packages

**What:** Install Python, Node.js, MySQL, and build tools  
**Time:** 5-10 minutes  
**Why:** These are the base requirements for running the application

```bash
# Switch to root user
sudo su

# Install all system packages
yum install -y python3 python3-pip python3-devel \
               mysql-server mysql-devel \
               gcc nodejs npm git
```

**Verify Installation:**
```bash
python3 --version    # Should show Python 3.6+
node --version       # Should show v10+
npm --version        # Should show 6.0+
mysql --version      # Should show 5.7+
gcc --version        # Should show 4.8+
```

**Expected Output:**
```
Python 3.8.x
v16.x.x
8.x.x
mysql Ver 5.7.x
gcc (GCC) 4.8.x
```

**Troubleshooting:**
- If Node.js version is too old, install from NodeSource:
  ```bash
  curl -sL https://rpm.nodesource.com/setup_16.x | bash -
  yum install -y nodejs
  ```

---

### Step 2: Start MySQL Service

**What:** Enable and start the MySQL database server  
**Time:** 1 minute

```bash
# Enable MySQL to start on boot
systemctl enable mysqld

# Start MySQL service
systemctl start mysqld

# Verify it's running
systemctl status mysqld
```

**Expected Output:**
```
● mysqld.service - MySQL Server
   Loaded: loaded (/usr/lib/systemd/system/mysqld.service; enabled)
   Active: active (running) since...
```

**Troubleshooting:**
- If MySQL fails to start, check logs:
  ```bash
  journalctl -xe -u mysqld
  tail -50 /var/log/mysqld.log
  ```

---

### Step 3: Create Database and User

**What:** Create the application database and database user  
**Time:** 2 minutes

**3a. Connect to MySQL:**
```bash
# For fresh MySQL installation (no root password)
mysql -u root

# OR if root password is set
mysql -u root -p
# Enter your MySQL root password when prompted
```

**3b. Run Database Setup Commands:**

Copy and paste these SQL commands:

```sql
CREATE DATABASE spmvv_results CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE USER 'spmvv_user'@'localhost' IDENTIFIED BY 'SpmvvDb@2026';

GRANT ALL PRIVILEGES ON spmvv_results.* TO 'spmvv_user'@'localhost';

FLUSH PRIVILEGES;

EXIT;
```

**3c. Verify Database Creation:**
```bash
mysql -u spmvv_user -pSpmvvDb@2026 -e "SHOW DATABASES;"
```

**Expected Output:**
```
+--------------------+
| Database           |
+--------------------+
| information_schema |
| spmvv_results      |
+--------------------+
```

**Troubleshooting:**
- If you get "Access denied", check the password and username
- If database already exists, it's okay - the application will use it

**📋 Note Down These Credentials:**
```
Database Name: spmvv_results
Database User: spmvv_user
Database Password: SpmvvDb@2026
```

---

### Step 4: Configure Backend Environment

**What:** Create configuration file with database credentials  
**Time:** 2 minutes  
**Location:** `backend/.env`

**4a. Navigate to backend directory:**
```bash
cd /root/spmvv-exam-results/backend
```

**4b. Create .env file:**
```bash
nano .env
```

**4c. Paste this configuration:**
```bash
# Django Secret Key - CHANGE THIS IN PRODUCTION!
SECRET_KEY=django-insecure-change-this-in-production-12345

# Debug mode - Set to False in production
DEBUG=True

# Allowed hosts - Add your server IP or domain
ALLOWED_HOSTS=localhost,127.0.0.1,YOUR_SERVER_IP

# Database Configuration
DB_NAME=spmvv_results
DB_USER=spmvv_user
DB_PASSWORD=SpmvvDb@2026
DB_HOST=localhost
DB_PORT=3306

# Admin User Configuration
ADMIN_USERNAME=admin
ADMIN_DEFAULT_PASSWORD=SpmvvExamResults

# CORS Settings (for development)
CORS_ALLOWED_ORIGINS=http://localhost:2026,http://127.0.0.1:2026,http://YOUR_SERVER_IP:2026
```

**4d. Replace YOUR_SERVER_IP:**
```bash
# Find your server IP
hostname -I | awk '{print $1}'

# Replace YOUR_SERVER_IP in .env with the actual IP
```

**4e. Save and exit:**
- Press `Ctrl+X`
- Press `Y` to confirm
- Press `Enter` to save

**Verify:**
```bash
cat .env | grep DB_
```

**Expected Output:**
```
DB_NAME=spmvv_results
DB_USER=spmvv_user
DB_PASSWORD=SpmvvDb@2026
DB_HOST=localhost
DB_PORT=3306
```

---

### Step 5: Setup Python Virtual Environment and Run Migrations

**What:** Install Python dependencies and setup database tables  
**Time:** 3-5 minutes

**5a. Create virtual environment:**
```bash
cd /root/spmvv-exam-results/backend
python3 -m venv venv
```

**5b. Activate virtual environment:**
```bash
source venv/bin/activate
```

**Your prompt should change to:**
```
(venv) [root@server backend]#
```

**5c. Upgrade pip:**
```bash
pip install --upgrade pip setuptools wheel
```

**5d. Install Python dependencies:**
```bash
pip install -r requirements.txt
```

**This will take 2-3 minutes. Expected output includes:**
```
Installing collected packages: Django, djangorestframework, mysqlclient, PyJWT, ...
Successfully installed Django-4.2.x djangorestframework-3.14.x ...
```

**5e. Run database migrations:**
```bash
python manage.py migrate
```

**Expected Output:**
```
Operations to perform:
  Apply all migrations: admin, auth, contenttypes, results, sessions
Running migrations:
  Applying contenttypes.0001_initial... OK
  Applying auth.0001_initial... OK
  ...
  Applying results.0001_initial... OK
```

**5f. Create admin user:**
```bash
python manage.py init_admin
```

**Expected Output:**
```
Admin user 'admin' created successfully!
Username: admin
Password: SpmvvExamResults
```

**5g. Collect static files:**
```bash
python manage.py collectstatic --noinput
```

**5h. Deactivate virtual environment:**
```bash
deactivate
```

**Troubleshooting:**
- If `mysqlclient` fails to install:
  ```bash
  yum install -y python3-devel mysql-devel gcc
  pip install mysqlclient
  ```

---

### Step 6: Configure Frontend Environment

**What:** Install Node.js dependencies and configure API URL  
**Time:** 3-5 minutes

**6a. Navigate to frontend directory:**
```bash
cd /root/spmvv-exam-results/frontend
```

**6b. Install npm dependencies:**
```bash
npm install
```

**This will take 3-5 minutes. Expected output:**
```
added 500+ packages in 3m
```

**6c. Create frontend .env file:**
```bash
# Get your server IP
SERVER_IP=$(hostname -I | awk '{print $1}')

# Create .env file
echo "VITE_API_URL=http://$SERVER_IP:8000/api" > .env

# Verify
cat .env
```

**Expected Output:**
```
VITE_API_URL=http://10.127.248.83:8000/api
```

**⚠️ CRITICAL:** The `/api` suffix is REQUIRED for login to work!

---

### Step 7: Configure Firewall (Optional)

**What:** Open ports 8000 and 2026 for web access  
**Time:** 1 minute

**Check if firewall is running:**
```bash
systemctl status firewalld
```

**If running, open ports:**
```bash
firewall-cmd --permanent --add-port=8000/tcp
firewall-cmd --permanent --add-port=2026/tcp
firewall-cmd --reload
```

**Verify:**
```bash
firewall-cmd --list-ports
```

**Expected Output:**
```
8000/tcp 2026/tcp
```

**If firewall is not running:**
```
Skip this step - ports are already accessible
```

---

## Step 8: Start the Application

**What:** Launch the backend and frontend servers  
**Time:** 30 seconds

```bash
cd /root/spmvv-exam-results
./run.sh
```

**Expected Output:**
```
==========================================
SPMVV Exam Results - Startup Script
==========================================

[0/8] Checking prerequisites...
✓ Python3: 3.8.x
✓ Node.js: v16.x.x
✓ npm: 8.x.x
✓ MySQL client installed
✓ Backend directory found
✓ Frontend directory found
✓ Python virtual environment exists

[1/8] Stopping previous services...
✓ Services stopped

[2/8] Backing up database...
✓ Database backed up

[3/8] Activating Python virtual environment...
✓ Virtual environment activated

[4/8] Checking backend dependencies...
✓ Dependencies OK

[5/8] Configuring frontend environment...
✓ Frontend dependencies OK
✓ Frontend .env configured with IP: 10.127.248.83

[6/8] Starting Django backend...
✓ Backend started on port 8000

[7/8] Starting React frontend...
✓ Frontend started on port 2026

[8/8] Application Status:
==========================================
✓ Application is running!

Access URLs:
  Frontend: http://10.127.248.83:2026
  Backend:  http://10.127.248.83:8000

Login Credentials:
  Username: admin
  Password: SpmvvExamResults

⚠ IMPORTANT: Change the default password after first login!

Logs:
  Backend:  /tmp/django.log
  Frontend: /tmp/vite.log

To stop the application:
  pkill -f 'manage.py runserver' && pkill -f 'vite'
==========================================
```

---

## Step 9: Access and Test

**Open your browser and navigate to:**
```
http://YOUR_SERVER_IP:2026
```

**Login with:**
- Username: `admin`
- Password: `SpmvvExamResults`

**You should see the dashboard!**

---

## Post-Installation Checklist

After successful deployment, verify:

- [ ] Can access frontend at `http://SERVER_IP:2026`
- [ ] Can access backend API at `http://SERVER_IP:8000/api/`
- [ ] Can login with admin credentials
- [ ] Dashboard loads properly
- [ ] Changed default admin password
- [ ] Noted down all credentials securely

---

## Common Issues and Solutions

### Issue 1: "Can't access the application from browser"

**Check 1: Services running?**
```bash
ps aux | grep -E '(manage.py|vite)' | grep -v grep
```
Should show 4+ processes

**Check 2: Firewall blocking?**
```bash
firewall-cmd --list-ports
```
Should show `8000/tcp 2026/tcp`

**Check 3: SELinux blocking?**
```bash
getenforce
```
If "Enforcing", temporarily disable:
```bash
setenforce 0
```

---

### Issue 2: "Login button doesn't work"

**Check frontend .env:**
```bash
cat /root/spmvv-exam-results/frontend/.env
```

**Should show:**
```
VITE_API_URL=http://YOUR_IP:8000/api
```

**Note the `/api` suffix - it's REQUIRED!**

**Fix:**
```bash
cd /root/spmvv-exam-results/frontend
echo "VITE_API_URL=http://$(hostname -I | awk '{print $1}'):8000/api" > .env

# Restart application
cd ..
pkill -f 'manage.py runserver' && pkill -f 'vite'
./run.sh
```

---

### Issue 3: "Database connection error"

**Check MySQL is running:**
```bash
systemctl status mysqld
```

**Check credentials in backend/.env:**
```bash
cat /root/spmvv-exam-results/backend/.env | grep DB_
```

**Test database connection:**
```bash
mysql -u spmvv_user -pSpmvvDb@2026 -e "USE spmvv_results; SHOW TABLES;"
```

---

### Issue 4: "Backend shows 500 error"

**Check backend logs:**
```bash
tail -50 /tmp/django.log
```

**Common causes:**
- Missing migrations: `cd backend && source venv/bin/activate && python manage.py migrate`
- Wrong SECRET_KEY: Check backend/.env
- Database connection: Verify DB credentials

---

## Daily Operations

### Starting the Application
```bash
cd /root/spmvv-exam-results
./run.sh
```

### Stopping the Application
```bash
pkill -f 'manage.py runserver' && pkill -f 'vite'
```

### Checking Logs
```bash
# Backend logs
tail -f /tmp/django.log

# Frontend logs
tail -f /tmp/vite.log
```

### Checking Status
```bash
ps aux | grep -E '(manage.py|vite)' | grep -v grep
```

### Database Backup
```bash
mysqldump -u spmvv_user -pSpmvvDb@2026 spmvv_results > backup_$(date +%Y%m%d).sql
```

---

## Security Recommendations

### 1. Change Default Passwords

**Admin Password:**
- Login to application
- Go to Settings → Change Password

**Database Password:**
```bash
mysql -u root -p
ALTER USER 'spmvv_user'@'localhost' IDENTIFIED BY 'NewStrongPassword';
FLUSH PRIVILEGES;
EXIT;

# Update backend/.env with new password
nano /root/spmvv-exam-results/backend/.env
```

### 2. Generate New Django SECRET_KEY

```bash
cd /root/spmvv-exam-results/backend
source venv/bin/activate
python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())'
```

Copy the output and update `SECRET_KEY` in `backend/.env`

### 3. Production Settings

Edit `backend/.env`:
```bash
DEBUG=False
SECRET_KEY=your-new-generated-secret-key
ALLOWED_HOSTS=your.domain.com,your.server.ip
```

### 4. Setup Firewall Rules

```bash
# Allow only required ports
firewall-cmd --permanent --remove-service=ssh  # If you use custom SSH port
firewall-cmd --permanent --add-port=8000/tcp
firewall-cmd --permanent --add-port=2026/tcp
firewall-cmd --reload
```

### 5. Setup SSL/HTTPS (Recommended for Production)

Consider using:
- Nginx as reverse proxy
- Let's Encrypt for SSL certificates
- Cloudflare for CDN and DDoS protection

---

## Getting Help

**Check logs first:**
```bash
tail -100 /tmp/django.log
tail -100 /tmp/vite.log
```

**Verify configuration:**
```bash
cat /root/spmvv-exam-results/backend/.env
cat /root/spmvv-exam-results/frontend/.env
```

**Test database:**
```bash
mysql -u spmvv_user -pSpmvvDb@2026 -e "USE spmvv_results; SHOW TABLES;"
```

**Restart application:**
```bash
pkill -f 'manage.py runserver' && pkill -f 'vite'
./run.sh
```

---

## Summary

**What we did:**
1. ✅ Installed system packages (Python, Node.js, MySQL, gcc)
2. ✅ Started MySQL service
3. ✅ Created database and user
4. ✅ Configured backend environment (.env)
5. ✅ Setup Python virtual environment
6. ✅ Installed Python dependencies
7. ✅ Ran database migrations
8. ✅ Created admin user
9. ✅ Configured frontend environment
10. ✅ Installed npm dependencies
11. ✅ Opened firewall ports
12. ✅ Started the application

**Next time (after reboot or to restart):**
```bash
cd /root/spmvv-exam-results
./run.sh
```

That's it! Just one command.

---

**🎉 Congratulations! Your SPMVV Exam Results application is now running!**
