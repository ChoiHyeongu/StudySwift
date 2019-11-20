import Swift

struct Sample {
    var mutableProp: Int = 100
    let immutableProp: Int = 100
    
    static var typeProp: Int = 100
    
    func instancMethod(){
        print ("instance")
    }
        
    static func typeMethod(){
        print ("type method")
    }
}

var mutable: Sample = Sample()

mutable.mutableProp = 200
//Fail mutable.immutableProp = 300
//Sample.instancMethod()

Sample.typeProp = 300
Sample.typeProp

struct Student {
    
    var name: String = "unknown"
    var `class`: String = "Swift"
    
    static func selfIntroduce() {
        print ("학생타입입니다.")
    }
    
    func selfIntroduce(){
        print (name)
    }
}

var students = Student()
students.name="Choi"
students.selfIntroduce()
Student.selfIntroduce()
