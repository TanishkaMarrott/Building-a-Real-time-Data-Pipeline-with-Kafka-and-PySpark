#!/bin/bash
# Kafka setup script
sudo yum update -y
sudo amazon-linux-extras install java-openjdk11 -y

# Download and extract Kafka
wget https://archive.apache.org/dist/kafka/2.6.0/kafka_2.12-2.6.0.tgz
tar -xzf kafka_2.12-2.6.0.tgz
cd kafka_2.12-2.6.0

# Start Kafka server
bin/kafka-server-start.sh config/server.properties
