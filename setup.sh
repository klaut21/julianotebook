# Generate a password
jupyter notebook password
# Wrote hashed password to /Users/m.kuegeler/.jupyter/jupyter_notebook_config.json
# Copy hash into .env

# Generate cert:
openssl req -x509 -nodes -newkey rsa:2048 -keyout jupyter.pem -out ./ssl-certs/jupyter.pem
