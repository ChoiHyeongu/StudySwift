import Swift

class Person {
    var name: String = ""
    
    func selfIntroduce(){
        print ("저는 \(name)입니다.")
    }
    
    final func sayHello(){
        print ("Hello")
    }
    
    static func typeMethod(){
        print ("type method - static")
    }
    
    class func classMethod() {
        print ("type-method - class")
    }
    
    final class func finalClassMethod(){
        print ("type-method - final class")
    }
    
}

class Student: Person {
    var major: String = ""
    
    override func selfIntroduce(){
        print ("wjsms \(name)이고, 전공은 \(major)입니다.")
    }
    
    override class func classMethod(){
        print ("Override class method")
    }
}

let yagom: Person = Person()
let hana: Student = Student()

yagom.selfIntroduce()
yagom.sayHello()

hana.selfIntroduce()
hana.sayHello()
