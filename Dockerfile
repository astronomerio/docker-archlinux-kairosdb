# Dockerfile to run KairosDB on Cassandra. Configuration is done through environment variables.
#
# Please set the following environment variables at image run time
#
#    $CASS_HOSTS 
#                  Cassandra seed nodes (host:port,host:port)
#
#    $REPFACTOR 
#                  Desired replication factor in Cassandra
#
# Sample Usage:
#                  docker run -P -e "CASS_HOSTS=192.168.1.63:9160" -e "REPFACTOR=1" enachb/archlinux-kairosdb


FROM ngty/archlinux-jdk7
MAINTAINER enachb

EXPOSE 8080
EXPOSE 4242
EXPOSE 2003
EXPOSE 2004

# Install KAIROSDB
RUN cd /opt; \
  curl -L http://dl.bintray.com:80/brianhks/generic/kairosdb-0.9.3.tar.gz | \
  tar zxfp -

ADD kairosdb.properties /tmp/kairosdb.properties
ADD runCass.sh /usr/bin/runCass.sh

# Run kairosdb in foreground on boot
ENTRYPOINT [ "/usr/bin/runCass.sh" ]