#enable ssh access
sudo apt-get -y install openssh-server
sudo service ssh status

#node and npm
sudo apt-get update
sudo apt-get -y install nodejs
sudo apt-get -y install npm
sudo apt-get -y install nodejs-legacy
nodejs --version
npm --version

#git
sudo apt-get update
sudo apt-get -y install git
git --version

#java8
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y install oracle-java8-installer
java -version

#docker
sudo apt-get update

sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
	
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
sudo apt-get update
sudo apt-get -y install docker-ce
sudo docker run hello-world

#jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get -y install jenkins

sudo groupadd docker
sudo usermod -aG docker jenkins

sudo service jenkins restart

#mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list

sudo apt-get update
sudo apt-get install -y mongodb-org
sudo service mongod start
sudo cat /var/log/mongodb/mongod.log

#postgre
sudo apt-get update
sudo apt-get -y install postgresql postgresql-contrib
