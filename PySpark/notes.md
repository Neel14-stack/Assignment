Q. spark context and spark session difference ?  
Q. Pyspark arch ?

- In PySpark, two separate process runs in the executor, a JVM that executes the Spark part of code (joins, aggregations and shuffles) and a python process that executes the user’s code. The two processes communicate via a Py4J bridge that exposes the JVM objects in the python process and vice-versa.
