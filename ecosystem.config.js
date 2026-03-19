module.exports = {
  apps: [{
    name: 'hemegene',
    script: '/root/gene_database_v0_03_dev/venv/bin/gunicorn',
    args: '--workers 3 --bind 127.0.0.1:6777 wsgi:app',
    cwd: '/root/gene_database_v0_03_dev',
    interpreter: 'none',
    env: {
      FLASK_ENV: 'production'
    },
    error_file: './hemegene-error.log',
    out_file: './hemegene-out.log',
    log_date_format: 'YYYY-MM-DD HH:mm:ss Z'
  }]
};
