from pyspark import SparkContext

sc = SparkContext("local", "first app")

# data_dir = r"C:\Users\caumont\Dropbox\Data"
data_dir = r"Z:\Dropbox\Data"

print(sc.version)

readme = sc.textFile(data_dir + "\README.md")
print(readme.count())