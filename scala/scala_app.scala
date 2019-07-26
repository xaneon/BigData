import org.apache.spark.SparkContext;
import org.apache.spark.SparkConf;

val conf = new SparkConf()
val appName = "My Application"
val app = conf.setAppName(appName)
app.setMaster("local[2]")

println(app)
