# Import enviroment variables from .env
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
else
  echo "File not found: .env"
  exit 1
fi

# Installing and initialiazing postgres
if command -v psql >/dev/null 2>&1 && sudo service postgresql status | grep -q "active (running)"; then
  echo "Postgres alredy installed"
else
  sudo apt update -y
  sudo apt install -y postgresql postgresql-contrib

  sudo systemctl enable postgresql
  sudo systemctl start postgresql
fi 

sudo -u postgres psql <<EOF
CREATE USER $USER_DB WITH PASSWORD '$PSW_DB';
CREATE DATABASE pagila OWNER $USER_DB;
EOF

# Downloanding Pagila files
if [ -d "pagila" ]; then
    rm -rf pagila
fi

mkdir pagila && cd pagila

wget https://github.com/devrimgunduz/pagila/raw/master/pagila-schema.sql
wget https://github.com/devrimgunduz/pagila/raw/master/pagila-data.sql

# Intalling Pagila
sudo -u $USER_DB psql -d pagila -f pagila-schema.sql
sudo -u $USER_DB psql -d pagila -f pagila-data.sql

sudo -u $USER_DB psql -d pagila <<EOF
ALTER SCHEMA public RENAME TO raw;
CREATE SCHEMA traeted;
EOF

echo "Pagila instaled!"