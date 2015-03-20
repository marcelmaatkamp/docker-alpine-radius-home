# Freeradius Docker example image

Lightweigth and fast starting Freeradius3 (3.0.6-r1) Docker image. This image size is 12.28 MB, starts blazingly fast and is based on Alpine Linux.  To use this image, clone this repo and make your own modifications.

The Dockerfile contains these values for you to modify:
```
# device
ENV DEVICE_NAME=router_wireless
ENV DEVICE_HOSTNAME=192.168.1.18
ENV DEVICE_SECRET=SECRET

# user
ENV USERNAME=testing
ENV PASSWORD=password
```

After modification build this image:
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

To  test with username 'testing' and password 'password' on device '192.168.1.18' and secret 'SECRET':
```
 $ radtest testing password 192.168.1.18 0 SECRET
```

To debug:
```
 $ docker logs freeradius-home
```
