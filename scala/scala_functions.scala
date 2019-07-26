import org.apache.spark.SparkContext;
import org.apache.spark.rdd.RDD;
// functions in scala

// 1. anonymous functions
val x = 42
val fun = (x: Int) => x + 1
println(x, fun(x))

// static methods in a global singleton object
object myfun {
    def fun1 (s: String): String = "Hallo " + s
}
println(myfun.fun1("Welt"))

// passing by reference:
val field = "Hello"

// use field_ !
def dosomething(rdd: RDD[String]):RDD[String] = {
    val field_ = field // this.field
    rdd.map(x => field_ + x)
}
// println(dosomething(field))

