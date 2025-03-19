curl  --location 'http://localhost:8083/connectors' \
      --header 'Accept: application/json' \
      --header 'Content-Type: application/json' \
      --data '{
   "name": "debezium-connector",
   "config": {
       "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
       "database.hostname": "localhost",
       "database.port": "5432",
       "database.user": "postgres",
       "database.password": "postgres",
       "database.dbname": "postgres",
       "table.include.list": "public.*",
       "topic.prefix": "cdc",
       "plugin.name": "pgoutput"