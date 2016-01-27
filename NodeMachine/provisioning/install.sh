sudo echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/environment
sudo echo "LANG=\"en_US.UTF-8\"" >> /etc/environment
sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y build-essential
# Node
# Using Ubuntu
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

# Mongo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org

#postgres
sudo apt-get update
sudo apt-get install -y postgresql postgresql-contrib
echo "go change the trust level for postgres, restart, add ssh key then hit enter"
read accept
sudo -H -u postgres bash -c 'echo "I am $USER, with uid $UID"'
sudo -H -u postgres bash -c 'createuser postgresql --superuser'
sudo -H -u postgres bash -c 'createdb -U postgresql debt_collection'
echo "psql -d debt_collection -c 'GRANT ALL PRIVILEGES ON DATABASE debt_collection TO postgresql;'"
sudo -u postgres -i


# apps
cd ~
mkdir app
cd app
git clone git@github.com:LiquidLabsGmbH/squealing-octo-giggle.git
cd squealing-octo-giggle
npm install
exit

# To run
#NODE_ENV="production"
#DISABLE_SERVICE_ACTIONS=0
#APP_DOMAIN="http://5369aa22.ngrok.io"  (the one that exposes :3000)
#APP_STATIC_DOMAIN="http://8c1ecc87.ngrok.io" node server/server.js (the one that exposes :8090)


#----- November 16th -----
