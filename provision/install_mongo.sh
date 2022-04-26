echo "=================INSTALLING REPO KEY=================="

sudo wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -

echo "=================INSTALLING MONGODB REPO=================="

sudo echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

echo "=================UPDATE PACKAGES=================="

sudo apt-get update 

echo "=================INSTALLING MONGODB=================="

sudo apt-get install -y mongodb-org