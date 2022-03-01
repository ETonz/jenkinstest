FROM php:8.0-apache as builder

RUN apt update && apt install git wget unzip curl -y
RUN git clone https://github.com/mikepfeiffer/simple-php-app.git

RUN mv /var/www/html/simple-php-app/index.php /var/www/html/simple-php-app/styles.css /var/www/html/simple-php-app/logo_aws_reduced.gif /var/www/html

FROM php:8.0-apache

COPY --from=builder /var/www/html /var/www/html
EXPOSE 80