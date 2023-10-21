FROM mysql

ENV MYSQL_ROOT_PASSWORD=adsw1423@g

ENV MYSQL_DATABASE=shopdb

COPY dump.sql /docker-entrypoint-initdb.d/

EXPOSE 3306