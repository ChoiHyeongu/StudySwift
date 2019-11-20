import Swift

func someFunc1(someOpt: Int?)->Void{}
func someFunc2(someOpt: Int)->Void{}

someFunc1(someOpt: nil)
//someFunc2(someOpt: nil)

var optValue: Int! = 100

switch optValue {
case .none:
    print ("None")
case .some(let value):
    print (value)
}

var optValue2: Int! = 100

switch optValue2 {
case .none:
    print ("None")
case .some(let value):
    print (value)
}

// optional unwrapping

func printName(name: String){
    print (name)
}

var myName: String! = nil
