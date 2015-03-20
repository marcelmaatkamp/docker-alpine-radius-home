#!/bin/bash
docker run -d \
   --name freeradius \
   -p 1812:1812/udp \
   -p 1813:1813 \
   -p 18120:18120 \
   --env PASSWORD=PASSWORD \
   marcelmaatkamp/freeradius-home
