FROM ngty/archlinux-jdk7
MAINTAINER ngty

# Install KAIROSDB
RUN cd /opt; \
  curl -L http://dl.bintray.com:80/brianhks/generic/kairosdb-0.9.3.tar.gz | \
  tar zxfp -

# Run kairosdb in foreground on boot
ENTRYPOINT ["/opt/kairosdb/bin/kairosdb.sh", "run"]
