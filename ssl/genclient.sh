mkdir -p  ~/.docker
openssl genrsa -out ~/.docker/key.pem 4096

openssl req -sha256 -new -key ~/.docker/key.pem -out ~/.docker/cert.csr \
    -subj '/CN=docker-client' -config openssl-common.cnf

openssl x509 -req -sha256 -in ~/.docker/cert.csr -CA ca.pem \
    -CAkey ca-key.pem -CAcreateserial \
    -out ~/.docker/cert.pem -days 365 -extensions v3_req \
    -extfile openssl-common.cnf
