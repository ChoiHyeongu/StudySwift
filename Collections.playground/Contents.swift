import Swift

var integers: Array<Int> = Array<Int>()
integers.append(1)
integers.append(100)
integers.append(1001)
integers.append(135)

print (integers)

print (integers.contains(100))
print (integers.contains(99))

print (integers)

integers.remove(at: 0)
print (integers)
integers.removeLast()
print (integers)
integers.removeAll()
print (integers)

var doubles: Array<Double> = [Double]()
var strings: [String] = [String]()
var characters: [Character] = []
let immutableArray = [1, 2, 3]

//Fail immutableArray.append(4)

var anyDictionary: Dictionary<String, Any> = [String: Any]()
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100
print(anyDictionary)
anyDictionary["someKey"] = "dictionary"
print(anyDictionary)
anyDictionary.removeValue(forKey: "anotherkey")
anyDictionary["someKey"] = nil
anyDictionary

let emptyDictionary: [String: String] = [:]
let initDictionary: [String: String] = ["name": "a"]
print (initDictionary)

var integerSet: Set<Int> = Set<Int>()
integerSet.insert(1)
integerSet.insert(11)
integerSet.insert(123)
integerSet.insert(1234)
integerSet.insert(123)

print (integerSet)

let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]

let union: Set<Int> = setA.union(setB)

let sortedUnion: [Int] = union.sorted()

let intersection: Set<Int> = setA.intersection(setB)

let subtracting: Set<Int> = setA.subtracting(setB)

print (setA)
print (setB)
print (union)
print (sortedUnion)
print (intersection)
print (subtracting)
