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
