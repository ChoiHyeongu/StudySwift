import Swift

var integers = [1, 2, 3]
let people = ["yagom": 10, "eric": 20, "mike": 12]

for integer in integers {
    print (integer)
}

for (name, age) in people {
    print ("\(name): \(age)")
}


while integers.count>1{
    integers.removeLast()
}

repeat {
    integers.removeLast()
} while integers.count > 0
