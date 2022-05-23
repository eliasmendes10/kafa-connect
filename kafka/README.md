# Endereços importantes
http://localhost:8083/connectors
http://localhost:8083/connector-plugins

# Criar um Schema-Registry
docker-compose exec kafka kafka-topics --create --topic persons-avro --bootstrap-server kafka:9092

# Acessar Schema Registry
docker-compose exec schema-registry bash

# Start a console consumer
kafka-avro-console-consumer \
  --topic persons-avro \
  --bootstrap-server kafka:9092 \
  --property schema.registry.url=http://localhost:8089

  # Produce your first records
  kafka-avro-console-producer \
  --topic persons-avro \
  --bootstrap-server kafka:9092 \
  --property schema.registry.url=http://localhost:8089 \
  --property value.schema="$(< /etc/tutorial/schema-registry/person-avro-schema.json)"


  //Connection_Atents
  //Cluster com 3 nodes


//Não tem a necessidade de usar schema registry