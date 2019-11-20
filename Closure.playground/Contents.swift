import Swift

func sumFunc(a: Int, b: Int) -> Int{
    return a + b
}

var sumResult = sumFunc(a: 1, b: 2)

var sum: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a + b
}

var result = sum(2, 3)

//Calculate

let add: (Int, Int) -> Int
add = { (a: Int, b: Int) -> Int in return a+b}

let minus: (Int, Int) -> Int
minus = { (a: Int, b: Int) -> Int in return a-b}

let multiple: (Int, Int) -> Int
multiple = { (a: Int, b: Int) -> Int in return a*b}

let divide: (Int, Int) -> Int
divide = { (a: Int, b: Int) -> Int in return a/b}

func calculate (a: Int, b: Int, method: (Int, Int)-> Int) -> Int{
    return method(a, b)
}

print (calculate(a: 3, b: 2, method: add))
print (calculate(a: 3, b: 2, method: minus))
print (calculate(a: 3, b: 2, method: multiple))
print (calculate(a: 3, b: 2, method: divide))

result = calculate(a: 10, b: 10) {(left: Int,right: Int) -> Int in
    return left + right
}

print (result)

result = calculate(a: 10, b: 10) {(left: Int, right: Int) in
    return left+right
}

print (result)

result = calculate(a: 10, b: 10, method: {
    return $0 + $1
})

print (result)

result = calculate(a: 10, b: 10) {$0 + $1}

print (result)
