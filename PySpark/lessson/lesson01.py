from pyspark.sql import SparkSession
import os
import sys

class HelloWorld:

    def __init__(self):
        os.environ['PYSPARK_PYTHON'] = sys.executable
        os.environ['PYSPARK_DRIVER_PYTHON'] = sys.executable
        