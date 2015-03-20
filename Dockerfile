FROM marcelmaatkamp/freeradius

# device
ENV DEVICE_NAME=router_wireless
ENV DEVICE_HOSTNAME=192.168.1.18
ENV DEVICE_SECRET=SECRET

# user
ENV USERNAME=testing
ENV PASSWORD=password

RUN echo "$USERNAME Cleartext-Password := \"$PASSWORD\"" >> /etc/raddb/users
RUN echo -e "client $DEVICE_NAME {\n ipaddr = $DEVICE_HOSTNAME\n secret = $DEVICE_SECRET\n}" >> /etc/raddb/clients.conf
