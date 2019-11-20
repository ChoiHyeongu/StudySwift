import Swift

var a: Int = 100

if a < 100 {
    print ("100 미만")
} else if a > 100 {
    print ("100 이상")
} else {
    print ("None")
}

switch a {
case 0:
    print ("zero")
case 1..<100:
    print ("1~99")
case 101...Int.max:
    print ("Over")
default:
    print ("default")
}
