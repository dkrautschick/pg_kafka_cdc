
# Kafka, Download, Install, https://kafka.apache.org/downloads

https://downloads.apache.org/kafka/3.9.0/kafka_2.13-3.9.0.tgz
tar -xzf kafka_2.13-3.9.0.tgz

# Generate cluster and start Kafka with KRaft
KAFKA_CLUSTER_ID="$(bin/kafka-storage.sh random-uuid)"
bin/kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c config/kraft/server.properties
bin/kafka-server-start.sh config/kraft/server.properties

# Or the good old way….  start zookeeper and broker
bin/zookeeper-server-start.sh config/zookeeper.properties
bin/kafka-server-start.sh config/server.properties

# Create a topic
bin/kafka-topics.sh --create --topic mytopic --bootstrap-server localhost:9092

# List topics
bin/kafka-topics.sh --list --bootstrap-server localhost:9092

# Check, produce and consume events
bin/kafka-topics.sh --describe --topic mytopic --bootstrap-server localhost:9092
bin/kafka-console-producer.sh --topic mytopic  --bootstrap-server localhost:9092
bin/kafka-console-consumer.sh --topic mytopic  --from-beginning --bootstrap-server localhost:9092
bin/kafka-topics.sh --topic mytopic --delete --describe --bootstrap-server localhost:9092

Download and extract an connector of your choice

# Debezium, Install, Download, https://debezium.io/releases/

wget https://repo1.maven.org/……/debezium-connector-postgres-3.0.4.Final-plugin.tar.gz

		mv ./debezium-connector-postgres-3.0.4.Final-plugin.tar.gz <e.g. YOUR KAFKA CLUSTER>
		cd <e.g. YOUR KAFKA CLUSTER>

tar -xzf debezium-connector-postgres-3.0.4.Final-plugin.tar.gz

# Add the extract path to e.g.
vi connect-distributed.properties or # vi connect-standalone.properties

…
# change folder in plugin.path=/home/postgres/kafka_2.13-3.9.0/
…

# Start Kafka Connect (as standalone on same server)
bin/connect-standalone.sh config/connect-standalone.properties 


# Configure Debezium example connector
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
   }
}'


