#docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#dnsmasq-centos
git clone https://github.com/shelleg/docker-container-dnsmasq-centos.git
