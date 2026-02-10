# SPMVV Exam Results - Prerequisites for Fresh RHEL Server

## System Requirements

### Operating System
- RHEL/CentOS/Rocky Linux 7+ 
- OR Ubuntu/Debian 18.04+
- Root or sudo access required

### Hardware
- RAM: Minimum 2GB (4GB recommended)
- Disk: 10GB free space
- CPU: 2 cores minimum

## Required Software

### 1. Python 3.8+
```bash
python3 --version
```

### 2. Node.js 16+ and npm
```bash
node --version
npm --version
```

### 3. MySQL/MariaDB 5.7+
```bash
mysql --version
```

### 4. System Tools
- gcc (C compiler)
- git
- python3-devel (for mysqlclient)
- mysql-devel (for MySQL client library)

## Installation on Fresh RHEL Server

### Option 1: Automated Setup (Recommended)
```bash
cd /path/to/spmvv-exam-results
./setup_new_environment.sh
```

This will:
- Install all system dependencies
- Create Python virtual environment
- Install Python packages
- Configure environment variables
- Setup database
- Create admin user
- Setup frontend
- Total time: ~10-15 minutes

### Option 2: Manual Installation

#### Step 1: Install System Packages
```bash
# RHEL/CentOS
sudo yum install -y python3 python3-pip python3-devel \
                    mysql-server mysql-devel \
                    gcc nodejs npm git

# Start MySQL
sudo systemctl enable mysqld
sudo systemctl start mysqld
```

#### Step 2: Configure MySQL Database
```bash
# Secure MySQL installation (set root password)
sudo mysql_secure_installation

# Create database and user
mysql -u root -p
```

```sql
CREATE DATABASE spmvv_results CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'spmvv_user'@'localhost' IDENTIFIED BY 'YourSecurePassword';
GRANT ALL PRIVILEGES ON spmvv_results.* TO 'spmvv_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

#### Step 3: Setup Backend
```bash
cd backend

# Create virtual environment
python3 -m venv venv
source venv/bin/activate

# Install dependencies
pip install --upgrade pip setuptools wheel
pip install -r requirements.txt

# Configure environment
cp .env.example .env
nano .env  # Edit database credentials and other settings
```

#### Step 4: Run Migrations
```bash
python manage.py migrate
python manage.py init_admin
python manage.py collectstatic --noinput
```

#### Step 5: Setup Frontend
```bash
cd ../frontend
npm install
echo "VITE_API_URL=http://YOUR_SERVER_IP:8000/api" > .env
```

#### Step 6: Start Application
```bash
cd ..
./run.sh
```

## Configuration Files

### Backend .env (backend/.env)
```bash
SECRET_KEY=your-random-secret-key
DEBUG=False
ALLOWED_HOSTS=your.server.ip,localhost,127.0.0.1

DB_NAME=spmvv_results
DB_USER=spmvv_user
DB_PASSWORD=your-secure-password
DB_HOST=localhost
DB_PORT=3306

ADMIN_USERNAME=admin
ADMIN_DEFAULT_PASSWORD=YourSecurePassword
```

### Frontend .env (frontend/.env)
```bash
VITE_API_URL=http://YOUR_SERVER_IP:8000/api
```

## Network Requirements

### Firewall Rules
```bash
# Open ports if firewall is enabled
sudo firewall-cmd --permanent --add-port=8000/tcp
sudo firewall-cmd --permanent --add-port=2026/tcp
sudo firewall-cmd --reload
```

### SELinux (if enabled)
```bash
# Check SELinux status
getenforce

# If enforcing, you may need to configure policies
# or temporarily set to permissive for testing
sudo setenforce 0
```

## Verification Checklist

Before running the application, verify:

- [ ] Python 3.8+ installed: `python3 --version`
- [ ] Node.js 16+ installed: `node --version`
- [ ] npm installed: `npm --version`
- [ ] MySQL running: `systemctl status mysqld`
- [ ] Database created and accessible
- [ ] Backend .env configured with correct credentials
- [ ] Frontend .env configured with server IP
- [ ] Ports 8000 and 2026 accessible
- [ ] No firewall blocking connections

## Common Issues

### Issue: "python3: command not found"
```bash
sudo yum install python3
```

### Issue: "node: command not found"
```bash
# Install Node.js from NodeSource
curl -sL https://rpm.nodesource.com/setup_16.x | sudo bash -
sudo yum install nodejs
```

### Issue: "mysql: command not found"
```bash
sudo yum install mysql-server
sudo systemctl start mysqld
```

### Issue: "mysqlclient failed to install"
```bash
sudo yum install python3-devel mysql-devel gcc
```

### Issue: "Can't connect to MySQL server"
```bash
# Check MySQL is running
sudo systemctl status mysqld

# Check MySQL port
sudo netstat -tlnp | grep 3306

# Test connection
mysql -u spmvv_user -p -h localhost
```

## Quick Start Command Summary

```bash
# 1. Copy code to server
scp -r spmvv-exam-results root@your-server:/root/

# 2. SSH to server
ssh root@your-server

# 3. Run setup
cd /root/spmvv-exam-results
./setup_new_environment.sh

# 4. Access application
# Frontend: http://YOUR_SERVER_IP:2026
# Username: admin
# Password: SpmvvExamResults
```

## Production Recommendations

1. Change default admin password immediately
2. Use strong database passwords
3. Generate unique SECRET_KEY
4. Set DEBUG=False in production
5. Configure SSL/HTTPS
6. Setup regular database backups
7. Configure systemd services for auto-start
8. Enable firewall with only required ports
9. Keep system packages updated
10. Monitor logs regularly
