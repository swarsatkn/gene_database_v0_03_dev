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
