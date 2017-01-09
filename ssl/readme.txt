cd ssl
genca.sh
installcerts.sh
genserver.sh
genclient.sh

cat>/etc/sysconfig/docker<<EOF
DOCKER_OPTS=--tls --tlscert=/etc/docker/server-cert.pem --tlskey=/etc/docker/server-key.pem -H 0.0.0.0:2376
BLOCK_REGISTRY=
INSECURE_REGISTRY=
EOF

cat>/etc/sysconfig/docker-storage<<EOF
DOCKER_STORAGE_OPTIONS=
EOF

cat>/etc/sysconfig/docker-network<<EOF
DOCKER_NETWORK_OPTIONS=
EOF

modif /lib/systemd/system/docker.service
EnvironmentFile=/etc/sysconfig/docker
EnvironmentFile=/etc/sysconfig/docker-storage
EnvironmentFile=/etc/sysconfig/docker-network
ExecStart=
ExecStart=/usr/bin/dockerd $DOCKER_OPTS \
          $DOCKER_STORAGE_OPTIONS \
          $DOCKER_NETWORK_OPTIONS \
          $BLOCK_REGISTRY \
          $INSECURE_REGISTRY

systemctl daemon-reload
systemctl restart docker

firewall-cmd --permanent --zone=trusted --add-interface=enp0s8
systemctl restart firewalld

export DOCKER_HOST=tcp://192.168.56.100:2376 DOCKER_TLS_VERIFY=1
docker info
