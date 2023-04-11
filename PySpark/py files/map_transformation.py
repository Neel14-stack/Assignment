from pyspark.sql import SparkSession

spark  = SparkSession.builder.master("local[*]").appName("RDDProgram").getOrCreate()
sc = spark.sparkContext

intrdd = sc.parallelize([10,20,30,40,50])
intrdd1 = intrdd.map(lambda x : x**2)
print(intrdd1.collect())