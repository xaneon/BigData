println("Hallo")
val a = 42
println(a)
val b = 1 to 44 // create data from 1 to 44
println(b)

val distData = sc.parallelize(b) // parallelise b

val dataDir = raw"C:\Users\caumont\Dropbox\Data\"
val file = "README.md"
val fname = dataDir.concat(file)
val fname2 = dataDir + file
println(fname)
println(fname2)

val readme = sc.textFile(fname)
println(readme.count())

// let us read a file from hdfs:
val line = sc.textFile(raw"hdfs://0.0.0.0:19000/test/data.txt")
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
val lines = sc.textFile(raw"hdfs://0.0.0.0:19000/test/data.txt")
val words = lines.flatMap(line => line.split(" "))
println(words)
val wordsmap = words.map(word => (word, 1))
println(wordsmap)
val result = wordsmap.reduceByKey((a,b) => a + b)
println(result)
val finalresult = result.collect()
println(finalresult)