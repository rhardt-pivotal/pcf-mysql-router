#!/usr/bin/env bash
set -ex

{
  instance_name="mysqlrouter-config"

  url=`util/jq -j --arg instance_name $instance_name ".credhub[] | select(.instance_name == \"$instance_name\") | .credentials | .[\"db-url\"]" <<< $VCAP_SERVICES`
  password=`util/jq -j --arg instance_name $instance_name ".credhub[] | select(.instance_name == \"$instance_name\") | .credentials | .[\"db-password\"]" <<< $VCAP_SERVICES`

  echo $password | PATH=./bin LD_LIBRARY_PATH=./lib mysqlrouter --bootstrap ${url} --directory ./current --conf-base-port=8080

} &> /dev/null # Suppressing log message to prevent credentials from being logged in PCF

PATH=./bin LD_LIBRARY_PATH=./lib mysqlrouter -c ./current/mysqlrouter.conf &