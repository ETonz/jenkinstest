FROM php:8.0-apache as builder

#COPY github_key .
RUN apt update && apt install git wget unzip curl -y
RUN git clone https://github.com/mikepfeiffer/simple-php-app.git
#RUN eval $(ssh-agent) && \
#    ssh-add github_key && \
#    ssh-keyscan -H github.com >> /etc/ssh/ssh_known_hosts && \
#    git clone git@github.com:ETonz/simplephpapp.git
WORKDIR /var/www/html
RUN mv /var/www/html/simple-php-app/index.php /var/www/html/simple-php-app/styles.css /var/www/html/simple-php-app/logo_aws_reduced.gif /var/www/html
#RUN rm -rf github_key

FROM php:8.0-apache

COPY --from=builder /var/www/html /var/www/html
EXPOSE 80