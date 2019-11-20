import Swift

class Person{
    
    var name: String = "unknown"
    
    static func staticMethod(){
        print ("static")
    }
    
    func defaultMethod(){
        print (self.name)
    }
}

let choi:Person = Person()
choi.name = "Choi"
choi.defaultMethod()
Person.staticMethod()
