provider "aws" {
  region = "us-west-2"
}

resource "aws_msk_cluster" "example" {
  cluster_name = "example-cluster"
  kafka_version = "2.6.0"
  number_of_broker_nodes = 3

  broker_node_group_info {
    instance_type = "kafka.m5.large"

    client_subnets = ["subnet-abc123", "subnet-def456"]
    security_groups = ["sg-123456"]
  }
}
