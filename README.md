# Freeradius Docker example image

Lightweigth and fast starting Freeradius3 (3.0.6-r1) Docker image. This image size is 12.28 MB, starts blazingly fast and is based on Alpine Linux.  To use this image, clone this repo and make your own modifications.

Dockerfile:
```
$ cat Dockerfile
FROM marcelmaatkamp/freeradius

RUN echo "<<USERNAME>> Cleartext-Password := \"<<PASSWORD>>\"" >> /etc/raddb/users
RUN echo -e "client router_wireless {\n ipaddr = <<HOST_IP_ADDRESS>>\n secret = <<SECRET>>\n}" >> /etc/raddb/clients.conf
```

Build this image:
```
 $ docker build -t marcelmaatkamp/freeradius-home .
```

To start: 
```
 $ docker run -d \
   --name freeradius \
   -p 1812:1812/udp \
   -p 1813:1813 \
   -p 18120:18120 \
   marcelmaatkamp/freeradius-home
```

To just test user and password:
```
 $ docker exec -ti freeradius-home bash
 # radtest testing password localhost 0 SECRET
```

To debug:
```
 $ docker logs freeradius-home
```
