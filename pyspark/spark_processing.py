from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("KafkaSparkIntegration").getOrCreate()

df = spark.readStream.format("kafka") \
    .option("kafka.bootstrap.servers", "localhost:9092") \
    .option("subscribe", "my-topic") \
    .load()

df.selectExpr("CAST(key AS STRING)", "CAST(value AS STRING)").writeStream \
    .format("console") \
    .start() \
    .awaitTermination()
