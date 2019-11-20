import Swift

struct ValueType{
    var prop = 1
}

class RefProp{
    var prop = 1
}

let firstSI = ValueType()
var secondSI = firstSI
secondSI.prop = 2

print (firstSI.prop)
print (secondSI.prop)

let firstCR = RefProp()
var secondCR = firstCR
secondCR.prop = 2
print (firstCR.prop)
print (secondCR.prop)
