chmod -v 0400 ca-key.pem
chmod -v 0444 ca.pem 
cp -p ca.pem  /etc/pki/tls/certs/
cp -p ca-key.pem  /etc/pki/tls/private/
