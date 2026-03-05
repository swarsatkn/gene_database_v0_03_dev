# Hemegene Deployment Guide
## Ubuntu Server with PM2, Nginx, and Certbot (SSL)

---

## Prerequisites
- Ubuntu 20.04+ server
- Domain name pointing to your server IP
- SSH access to the server
- Root or sudo access

---

## Step 1: Update System and Install Dependencies

```bash
# Update system packages
sudo apt update && sudo apt upgrade -y

# Install Python and pip
sudo apt install python3 python3-pip python3-venv -y

# Install Node.js (required for PM2)
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install nodejs -y

# Install PM2 globally
sudo npm install -g pm2

# Install Nginx
sudo apt install nginx -y

# Install Certbot for SSL
sudo apt install certbot python3-certbot-nginx -y
```

---

## Step 2: Upload Your Application

```bash
# Create application directory
sudo mkdir -p /var/www/hemegene
sudo chown $USER:$USER /var/www/hemegene

# Option A: Clone from Git (if using Git)
# git clone https://your-repo-url.git /var/www/hemegene

# Option B: Upload files via SCP (from your local machine)
# scp -r c:\Reps\gene_database_v0_03_dev\* user@your-server:/var/www/hemegene/
```

---

## Step 3: Set Up Python Environment

```bash
cd /var/www/hemegene

# Create virtual environment
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate

# Install dependencies
pip install flask gunicorn

# If you have a requirements.txt:
# pip install -r requirements.txt

# Run database setup
python setup_database.py

# Deactivate venv
deactivate
```

---

## Step 4: Create Gunicorn WSGI Entry Point

Create a new file `/var/www/hemegene/wsgi.py`:

```bash
nano /var/www/hemegene/wsgi.py
```

Add the following content:

```python
from app import app

if __name__ == "__main__":
    app.run()
```

---

## Step 5: Create PM2 Ecosystem File

Create `/var/www/hemegene/ecosystem.config.js`:

```bash
nano /var/www/hemegene/ecosystem.config.js
```

Add the following content:

```javascript
module.exports = {
  apps: [{
    name: 'hemegene',
    script: '/var/www/hemegene/venv/bin/gunicorn',
    args: '--workers 3 --bind 127.0.0.1:6777 wsgi:app',
    cwd: '/var/www/hemegene',
    interpreter: 'none',
    env: {
      FLASK_ENV: 'production'
    },
    error_file: '/var/log/pm2/hemegene-error.log',
    out_file: '/var/log/pm2/hemegene-out.log',
    log_date_format: 'YYYY-MM-DD HH:mm:ss Z'
  }]
};
```

---

## Step 6: Start Application with PM2

```bash
# Create log directory
sudo mkdir -p /var/log/pm2
sudo chown $USER:$USER /var/log/pm2

cd /var/www/hemegene

# Start the application
pm2 start ecosystem.config.js

# Save PM2 process list (survives reboot)
pm2 save

# Set PM2 to start on boot
pm2 startup
# Run the command it outputs (will look like: sudo env PATH=... pm2 startup ...)

# Check status
pm2 status

# View logs
pm2 logs hemegene
```

---

## Step 7: Configure Nginx

Create Nginx configuration:

```bash
sudo nano /etc/nginx/sites-available/hemegene
```

Add the following content (replace `yourdomain.com` with your actual domain):

```nginx
server {
    listen 80;
    server_name yourdomain.com www.yourdomain.com;

    location / {
        proxy_pass http://127.0.0.1:6777;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_cache_bypass $http_upgrade;
        proxy_read_timeout 90;
    }

    # Static files (optional optimization)
    location /static {
        alias /var/www/hemegene/static;
        expires 30d;
        add_header Cache-Control "public, immutable";
    }
}
```

Enable the site:

```bash
# Create symbolic link
sudo ln -s /etc/nginx/sites-available/hemegene /etc/nginx/sites-enabled/

# Remove default site (optional)
sudo rm /etc/nginx/sites-enabled/default

# Test Nginx configuration
sudo nginx -t

# Restart Nginx
sudo systemctl restart nginx
sudo systemctl enable nginx
```

---

## Step 8: Configure Firewall

```bash
# Allow SSH, HTTP, and HTTPS
sudo ufw allow OpenSSH
sudo ufw allow 'Nginx Full'
sudo ufw enable

# Check status
sudo ufw status
```

---

## Step 9: Install SSL Certificate with Certbot

```bash
# Obtain and install SSL certificate (replace with your domain)
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com

# Follow the prompts:
# - Enter your email
# - Agree to terms
# - Choose whether to redirect HTTP to HTTPS (recommended: Yes)

# Test automatic renewal
sudo certbot renew --dry-run
```

---

## Step 10: Verify Deployment

```bash
# Check PM2 status
pm2 status

# Check if port 6777 is listening
sudo netstat -tlnp | grep 6777

# Check Nginx status
sudo systemctl status nginx

# Test the application
curl http://localhost:6777
curl http://yourdomain.com
```

---

## Useful PM2 Commands

```bash
# View status
pm2 status

# View logs
pm2 logs hemegene

# Restart application
pm2 restart hemegene

# Stop application
pm2 stop hemegene

# Delete from PM2
pm2 delete hemegene

# Monitor resources
pm2 monit
```

---

## Troubleshooting

### Application not starting
```bash
# Check PM2 logs
pm2 logs hemegene --lines 100

# Test manually
cd /var/www/hemegene
source venv/bin/activate
gunicorn --bind 127.0.0.1:6777 wsgi:app
```

### Nginx errors
```bash
# Check Nginx error log
sudo tail -f /var/log/nginx/error.log

# Test configuration
sudo nginx -t
```

### Permission issues
```bash
# Fix ownership
sudo chown -R $USER:www-data /var/www/hemegene
sudo chmod -R 755 /var/www/hemegene
```

### SSL Certificate renewal
```bash
# Renew manually
sudo certbot renew

# Check certificate status
sudo certbot certificates
```

---

## File Structure on Server

```
/var/www/hemegene/
├── app.py
├── wsgi.py
├── ecosystem.config.js
├── setup_database.py
├── genedatabase.db
├── requirements.txt
├── venv/
├── static/
│   ├── Hemegene.gif
│   ├── Hemegene Logo.png
│   └── ...
└── templates/
    ├── index.html
    ├── gene_info.html
    └── about.html
```

---

## Quick Reference

| Service | Command |
|---------|---------|
| Start app | `pm2 start ecosystem.config.js` |
| Restart app | `pm2 restart hemegene` |
| View logs | `pm2 logs hemegene` |
| Restart Nginx | `sudo systemctl restart nginx` |
| Renew SSL | `sudo certbot renew` |

---

**Your app will be available at:** `https://yourdomain.com`
