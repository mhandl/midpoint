FROM tomcat:8.5.28-jre8-alpine
ENV JAVA_OPTS="-server -Xms512m -Xmx1024m -Dmidpoint.home=/var/opt/midpoint/ -Djavax.net.ssl.trustStore=/var/opt/midpoint/keystore.jceks -Djavax.net.ssl.trustStoreType=jceks"

MAINTAINER mhandl@gmail.com

ENV version 3.7

RUN apk upgrade --update &&\
    apk add --no-cache bash wget

RUN wget https://evolveum.com/downloads/midpoint/${version}/midpoint-${version}-dist.tar.gz

RUN echo 'Extracting midPoint archive...' \
&& tar xzf midpoint-${version}-dist.tar.gz \
&& rm -f midpoint-${version}-dist.tar.gz

RUN cp midpoint-${version}/war/midpoint.war /usr/local/tomcat/webapps \
&& rm -rf midpoint-${version}

# Define data volumes
VOLUME ["/var/opt/midpoint", "/usr/local/tomcat/logs"]

CMD ["catalina.sh", "run"]
