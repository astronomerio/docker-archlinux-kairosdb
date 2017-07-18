#!/bin/bash

export PORT_TELNET=${PORT_TELNET:-4242}
export PORT_HTTP=${PORT_HTTP:-8080}
export PORT_CARBON_TEXT=${PORT_CARBON_TEXT:-2003}
export PORT_CARBON_PICKLE=${PORT_CARBON_PICKLE:-2004}
export CASS_HOSTS=${CASS_HOSTS:-"localhost:9160"}
export REPFACTOR=${REPFACTOR:-1}
export READ_CONSISTENCY_DATA=${READ_CONSISTENCY_DATA:-ONE}
export WRITE_CONSISTENCY_DATA=${WRITE_CONSISTENCY_DATA:-QUORUM}
export READ_CONSISTENCY_INDEX=${READ_CONSISTENCY_INDEX:-ONE}
export READ_CONSISTENCY_INDEX=${WRITE_CONSISTENCY_INDEX:-QUORUM}
export ENABLE_ROLLUPS=${ENABLE_ROLLUPS:-0}

KAIROSDB_CONF=/opt/kairosdb/conf/kairosdb.properties

function main {
  echo "- env ------------------------------------------------------------------"
  env | sort
  echo "------------------------------------------------------------------------"
  echo "- kairosdb.properties --------------------------------------------------"
  /usr/sbin/envsubst < /tmp/kairosdb.properties > ${KAIROSDB_CONF}
  if [[ ${ENABLE_ROLLUPS} == 1 ]]; then
    echo "kairosdb.service.rollups=org.kairosdb.rollup.RollUpModule" >> ${KAIROSDB_CONF}
  fi
  cat ${KAIROSDB_CONF}
  echo "------------------------------------------------------------------------"
  /opt/kairosdb/bin/kairosdb.sh run
}

main "$@"
