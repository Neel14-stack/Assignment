from pyspark.sql import SparkSession
import os
import sys

class HelloWorld:

    def __init__(self):
        os.environ['PYSPARK_PYTHON'] = sys.executable
        os.environ['PYSPARK_DRIVER_PYTHON'] = sys.executable

    def initSpark(self):
        spark = SparkSession.builder.master("local[*]").getOrCreate()
        sc = spark.sparkContext
        return spark,sc
    

if __name__=='__main__':
    hworld = HelloWorld()
    spark,sc = hworld.initSpark()
    data = ['Welcome to PySpark','Hello World!!']
    rdd1 = sc.parallelize(data)
    print(rdd1.collect())