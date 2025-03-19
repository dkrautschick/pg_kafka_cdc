bin/connect-standalone.sh config/connect-standalone.properties

bin/kafka-topics.sh --list --bootstrap-server localhost:9092



bin/kafka-console-consumer.sh --topic /*TOPIC_NAME*/  --from-beginning --bootstrap-server localhost:9092
