println("Hallo")
val a = 42
println(a)
val b = 1 to 44 // create data from 1 to 44
println(b)

val distData = sc.parallelize(b) // parallelise b

// val dataDir = raw"C:\Users\caumont\Dropbox\Data\"
val dataDir = raw"Z:\Dropbox\Data"
val file = "README.md"
val fname = dataDir.concat(file)
val fname2 = dataDir + file
println(fname)
println(fname2)

val readme = sc.textFile(fname)
println(readme.count())

// let us read a file from hdfs:
//val line = sc.textFile(raw"hdfs://0.0.0.0:19000/test/data.txt")
val line = sc.textFile(raw"hdfs://0.0.0.0:9000/test/data.txt")
println(line)

// next, we are going to apply a transformation
val lineLengths = line.map(x => x.length)
println(lineLengths)

// next, we invoke an action:
// val totalLength = lineLengths.reduce((a,b) => a + b)
// println(totalLength)

// reduce example:
val l = List(2,3,4,5)
val r = l.reduce((x, y) => x max y)
println(r)

// MapReduce example:
// val lines = sc.textFile("data.txt")
// val lines = sc.textFile(raw"hdfs://0.0.0.0:19000/test/data.txt")
val lines = sc.textFile(raw"hdfs://0.0.0.0:9000/test/data.txt")
val words = lines.flatMap(line => line.split(" "))
println(words)
val wordsmap = words.map(word => (word, 1))
println(wordsmap)
val result = wordsmap.reduceByKey((a,b) => a + b)
println(result)
val finalresult = result.collect()
println(finalresult)
// end interactive mode with :quit

// show the directed acyclic graph (DAG)
println(result.toDebugString)

// let us have a look at an example logfile
// create the RDD
// val logFile = sc.textFile("examplelog.txt")
// val logFile = sc.textFile(raw"hdfs://0.0.0.0:19000/test/examplelog.txt")
val logFile = sc.textFile(raw"hdfs://0.0.0.0:9000/test/examplelog.txt")

// Transformations:
val errors = logFile.filter(_.startsWith("ERROR"))
val messages = errors.map(_.split("\t")).map(r => r(0))

// Caching:
messages.cache()

// Actions:
val n1 = messages.filter(_.contains("example")).count()
val n2 = messages.filter(_.contains("MySQL")).count()
println(n1)
println(n2)

// let us look at the transformations here as well
println(messages.toDebugString)

// key-value pairs in scala
val pair = ("a", "b")
println(pair._1)
println(pair._2)

