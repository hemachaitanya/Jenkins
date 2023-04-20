FROM ubuntu:latest
ARG HOME_DIR='/var/www/html'
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt install apache2 -y
RUN apt update && apt install libapache2-mod-php php -y
WORKDIR ${HOME_DIR}
RUN echo "<?php phpinfo() ?>" > /var/www/html/info.php
EXPOSE 80
CMD [ "apache2ctl","-D","FOREGROUND" ]
# git add php.dockerfile