# Docker for dnsmasq 

This is the Dockerfile setup for [dnsmasq](http://www.thekelleys.org.uk/dnsmasq/doc.html).

## Building (optional)
To build the image locally:

```bash
git clone https://github.com/blackbarn/docker-dnsmasq.git;
cd docker-dnsmasq;
docker build -t dnsmasq .
```

## Running

```bash
docker run -d -v /your_config_location:/etc/dnsmasq.d -p "53:5353/udp" --name dnsmasq dnsmasq
```

Or you can replace `dnsmasq` with `blackbarn/dnsmasq` in your `run` command to use the pre-built image from docker hub.

```bash
docker run -d -v /your_config_location:/etc/dnsmasq.d -p "53:5353/udp" --name dnsmasq blackbarn/dnsmasq
```

Change the port mapping to suit your needs. Say you already have a DNS server listening on another interface and need to lock this one down to another:

```bash
docker run -d -v /your_config_location:/etc/dnsmasq.d -p "192.168.1.100:53:5353/udp" --name dnsmasq blackbarn/dnsmasq
```

## Configuration

See the dnsmasq docs for details, however all you need to do is add `*.conf` files to your `/your_config_location/` and dnsmasq will pick them up and try to enforce their rules.

For example:

```bash
# /your_config_location/config.conf
#
# send *.docker lookups to another DNS server
server=/docker/172.17.42.1
# *.lan hosts/urls get sent to a specific IP
address=/.lan/192.168.1.3
```

## Compose

An example of a `docker-compose.yml` file:

```yml
dns:
  build: .
  container_name: dnsmasq
  volumes:
    - /data/dnsmasq:/etc/dnsmasq.d
  ports:
    - "192.168.1.3:53:5353/udp"
  restart: always
```

Obviously your volume mapping will vary.
