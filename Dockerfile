FROM tomcat:8.5.28-jre8-alpine
ENV JAVA_OPTS="-server -Xms512m -Xmx1024m -Dmidpoint.home=/var/opt/midpoint/ -Djavax.net.ssl.trustStore=/var/opt/midpoint/keystore.jceks -Djavax.net.ssl.trustStoreType=jceks"

MAINTAINER mhandl@gmail.com

ENV version 3.7

RUN apt-get update \
&& apt-get -y install wget

RUN wget https://evolveum.com/downloads/midpoint/${version}/midpoint-${version}-dist.tar.bz2

RUN echo 'Extracting midPoint archive...' \
&& tar xjf midpoint-${version}-dist.tar.bz2 \
&& rm -f midpoint-${version}-dist.tar.bz2

RUN cp midpoint-${version}/war/midpoint.war /usr/local/tomcat/webapps \
&& rm -rf midpoint-${version}

# Define data volumes
VOLUME ["/var/opt/midpoint", "/usr/local/tomcat/logs"]

CMD ["catalina.sh", "run"]