##mysql-router on Pivotal Application Service (PAS)

#Prerequsites
In order to run `mysql-router` on PAS, you need to use `CredHub` to securely store mysql database credentials. You can create
an instance of `CredHub` by using command below.

```
$ cf create-service credhub default mysqlrouter-config -c '{"db-url":"db-user@innodb-master-node-url:node-port", "db-password":"very-secure-password"}'
```

Please note that the instance name `mysqlrouter-config` is used in the `start.sh` script, so please update it if you want to use a 
different instance name.

Once you create an instance, you can then bind it to your `mysql-router` application.

```
$ cf bind-service your-mysqlrouter-app-name mysqlrouter-config
```

# Push `mysql-router`

All you now have to do is to use `cf` to push the app.

```
$ cf push
```

The following is the official README for `mysql-router`.

===========================================================================


Copyright (c) 2015, 2019, Oracle and/or its affiliates. All rights reserved.

This is a release of MySQL Router, a building block for high
availability solutions based on MySQL InnoDB clusters.

License information can be found in the LICENSE.router file.

This distribution may include materials developed by third parties.
For license and attribution notices for these materials,
please refer to the LICENSE.router file.

For further information on MySQL Router or additional documentation, visit
  https://dev.mysql.com/doc/mysql-router/8.0/en/

For additional downloads and the source of MySQL, visit
  http://dev.mysql.com/downloads/

MySQL Router is brought to you by the MySQL team at Oracle.
