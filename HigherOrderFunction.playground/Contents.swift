import Swift

let numbers: [Int] = [0, 1, 2, 3, 4]
var doubledNumbers: [Int]
var strings: [String]

doubledNumbers = [Int]()
strings = [String]()

for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}

doubledNumbers = numbers.map({(number: Int) -> Int in
    return number * 2
})

strings = numbers.map({(number: Int) -> String in
    return "\(number)"
})


doubledNumbers = numbers.map {$0 * 2}

var filtered: [Int] = [Int]()

for number in numbers {
    if number % 2 == 0 {
        filtered.append(number)
    }
}

print (numbers.filter{$0 % 2 == 0})

let evenNum: [Int] = numbers.filter{$0 % 2 == 0}

print(evenNum)

let someNumbers: [Int] = [2, 8 , 15]
let sum = someNumbers.reduce(0){$0 + $1}
print (sum)
print (someNumbers.reduce(1){$0 * $1})
