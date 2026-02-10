# SPMVV Exam Results - RHEL 10.1 Setup Commands

## Quick Setup for RHEL 10.1 Coughlan

### Step 1: Install System Packages

```bash
# Switch to root
sudo su

# Install Python, MariaDB, and build tools
yum install -y python3 python3-pip python3-devel \
               mariadb-server mariadb-connector-c-devel \
               gcc git

# Install Node.js 18 LTS from NodeSource
curl -sL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y nodejs

# Verify installations
python3 --version
node --version
npm --version
mysql --version
```

---

### Step 2: Start MariaDB (MySQL Compatible Database)

```bash
# Enable and start MariaDB
systemctl enable mariadb
systemctl start mariadb

# Verify it's running
systemctl status mariadb
```

---

### Step 3: Create Database and User

```bash
# Connect to MariaDB (no password on fresh install)
mysql -u root

# Run these SQL commands:
CREATE DATABASE spmvv_results CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'spmvv_user'@'localhost' IDENTIFIED BY 'SpmvvDb@2026';
GRANT ALL PRIVILEGES ON spmvv_results.* TO 'spmvv_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;

# Test connection
mysql -u spmvv_user -pSpmvvDb@2026 -e "SHOW DATABASES;"
```

---

### Step 4: Setup Backend

```bash
cd /root/spmvv-exam-results/backend

# Get server IP
SERVER_IP=$(hostname -I | awk '{print $1}')

# Create .env file
cat > .env <<EOF
SECRET_KEY=django-insecure-change-this-in-production-12345
DEBUG=True
ALLOWED_HOSTS=localhost,127.0.0.1,$SERVER_IP

DB_NAME=spmvv_results
DB_USER=spmvv_user
DB_PASSWORD=SpmvvDb@2026
DB_HOST=localhost
DB_PORT=3306

ADMIN_USERNAME=admin
ADMIN_DEFAULT_PASSWORD=SpmvvExamResults

CORS_ALLOWED_ORIGINS=http://localhost:2026,http://127.0.0.1:2026,http://$SERVER_IP:2026
EOF

# Create virtual environment
python3 -m venv venv
source venv/bin/activate

# Install Python dependencies
pip install --upgrade pip setuptools wheel
pip install -r requirements.txt

# Run migrations
python manage.py migrate
python manage.py init_admin
python manage.py collectstatic --noinput

# Deactivate venv
deactivate
```

---

### Step 5: Setup Frontend

```bash
cd /root/spmvv-exam-results/frontend

# Install npm dependencies
npm install

# Get server IP and create .env
SERVER_IP=$(hostname -I | awk '{print $1}')
echo "VITE_API_URL=http://$SERVER_IP:8000/api" > .env

# Verify
cat .env
```

---

### Step 6: Configure Firewall

```bash
# Open required ports
firewall-cmd --permanent --add-port=8000/tcp
firewall-cmd --permanent --add-port=2026/tcp
firewall-cmd --reload

# Verify
firewall-cmd --list-ports
```

---

### Step 7: Start the Application

```bash
cd /root/spmvv-exam-results
./run.sh
```

---

## Or Use the Updated Automated Script

```bash
cd /root/spmvv-exam-results
chmod +x setup_fresh_server.sh
sudo ./setup_fresh_server.sh
./run.sh
```

---

## Key Differences for RHEL 10

1. **MariaDB instead of MySQL** - RHEL 10 uses MariaDB by default (fully MySQL compatible)
2. **Package names:**
   - `mariadb-server` instead of `mysql-server`
   - `mariadb-connector-c-devel` instead of `mysql-devel`
3. **Service name:** `mariadb` instead of `mysqld`
4. **Node.js:** Install from NodeSource for latest version

---

## Access the Application

**Frontend:** `http://YOUR_SERVER_IP:2026`  
**Backend:** `http://YOUR_SERVER_IP:8000`

**Login:**
- Username: `admin`
- Password: `SpmvvExamResults`

---

## Troubleshooting RHEL 10

### Issue: "No package mariadb-server available"

```bash
# Enable PowerTools/CodeReady repo
dnf config-manager --set-enabled crb

# Or install directly
dnf install mariadb-server mariadb-connector-c-devel
```

### Issue: Node.js version too old

```bash
# Install from NodeSource
curl -sL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y nodejs
```

### Issue: mysqlclient won't install

```bash
# Make sure you have the devel packages
yum install -y python3-devel mariadb-connector-c-devel gcc

# Then retry in venv
source backend/venv/bin/activate
pip install mysqlclient
```

---

## Daily Operations

**Start:** `./run.sh`  
**Stop:** `pkill -f 'manage.py runserver' && pkill -f 'vite'`  
**Logs:** `tail -f /tmp/django.log` or `tail -f /tmp/vite.log`
