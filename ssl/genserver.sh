mkdir -p  /etc/docker/ssl
cp openssl-common.cnf /etc/docker/ssl/openssl-server.cnf
export x=""
export i=100
while [ $i -lt 111 ]; do i=`expr $i + 1`;export x="$x,IP:192.168.56.$i";  done
echo subjectAltName = DNS:$HOSTNAME,IP:192.168.56.100$x,IP:127.0.0.1  >>/etc/docker/ssl/openssl-server.cnf

openssl genrsa -out /etc/docker/ssl/server-key.pem 4096

openssl req -sha256 -new -key /etc/docker/ssl/server-key.pem \
    -out /etc/docker/ssl/server.csr \
    -subj '/CN=docker-server' -config /etc/docker/ssl/openssl-server.cnf

openssl x509 -req -sha256 -in /etc/docker/ssl/server.csr -CA ca.pem \
    -CAkey ca-key.pem -CAcreateserial \
    -out /etc/docker/ssl/server-cert.pem -days 365 -extensions v3_req \
    -extfile /etc/docker/ssl/openssl-server.cnf

cp -p ca.pem  /etc/docker/ssl
chmod -v 0444 /etc/docker/ssl/ca.pem /etc/docker/ssl/server-cert.pem 

