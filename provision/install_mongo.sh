echo "=================INSTALLING REPO KEY=================="

sudo wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -

echo "=================INSTALLING MONGODB REPO=================="

sudo echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

echo "=================UPDATE PACKAGES=================="

sudo apt-get update 

echo "=================INSTALLING MONGODB=================="

sudo apt-get install -y mongodb-org