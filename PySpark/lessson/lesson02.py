from configspark import ConfigSpark

"""
In this class we intialize the spark session using a config file run the spark program for the hello world
"""

class HwConfig:
    pass

if __name__ == '__main__':
    spConfig = ConfigSpark()
    spark,sc = spConfig.initializeSpark()
    spConfig.quiet_logs(sc)
    data = ['Welcome to PySpark','Hello World']
    rdd1 = sc.parallelize(data)
    print(rdd1.collect())
