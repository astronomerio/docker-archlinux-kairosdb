mesosphere/archlinux-kairosdb
=============================

Dockerfile to run KairosDB on Cassandra. Configuration is done through environment variables.

The following environment variables can be set
```
    $CASS_HOSTS           [kairosdb.datastore.cassandra.host_list] (default: localhost:9160)
                          Cassandra seed nodes (host:port,host:port)

    $REPFACTOR            [kairosdb.datastore.cassandra.replication_factor] (default: 1)
                          Desired replication factor in Cassandra

    $PORT_TELNET          [kairosdb.telnetserver.port] (default: 4242)
                          Port to bind for telnet server

    $PORT_HTTP            [kairosdb.jetty.port] (default: 8080)
                          Port to bind for http server

    $PORT_CARBON_TEXT     [kairosdb.carbon.text.port] (default: 2003)
                          Port to bind for carbon text server

    $PORT_CARBON_PICKLE   [kairosdb.carbon.pickle.port] (default: 2004)
                          Port to bind for carbon pickle server

    $READ_CONSISTENCY_DATA     [kairosdb.datastore.cassandra.data_read_consistency_level] (default: ONE)
                               Consistency Level for Data Read to Cassandra Database

    $WRITE_CONSISTENCY_DATA    [kairosdb.datastore.cassandra.data_write_consistency_level] (default: QUORUM)
                               Consistency Level for Data Writes to Cassandra Database

    $READ_CONSISTENCY_INDEX    [kairosdb.datastore.cassandra.index_read_consistency_level] (default: ONE)
                               Consistency Level for Index Reads to Cassandra Database

    $WRITE_CONSISTENCY_INDEX   [kairosdb.datastore.cassandra.index_write_consistency_level] (default: QUORUM)
                               Consistency Level for Index Writes to Cassandra Database
```
#Sample Usage:
```
docker run -P -e "CASS_HOSTS=192.168.1.63:9160" -e "REPFACTOR=1" mesosphere/archlinux-kairosdb
```
