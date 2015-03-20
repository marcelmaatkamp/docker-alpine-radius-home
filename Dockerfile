FROM marcelmaatkamp/freeradius

RUN echo "testing Cleartext-Password := \"password\"" >> /etc/raddb/users
RUN echo -e "client router_wireless {\n ipaddr = 192.168.1.18\n secret = SECRET\n}" >> /etc/raddb/clients.conf
