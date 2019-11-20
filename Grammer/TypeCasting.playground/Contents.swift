import Swift

class Person {
    var name: String = ""
    func breath(){
        print ("숨을 쉽니다.")
    }
}

class Student: Person {
    var school: String = ""
    func goToSchoo() {
        print ("등교를 합니다.")
    }
}

class UniversityStudent: Student{
    var major: String = ""
    func goToMT(){
        print ("엠티를 갑니다.")
    }
}

var yagom: Person = Person()
var hana: Student = Student()
var jason: UniversityStudent = UniversityStudent()

var result: Bool

result = yagom is Person
result = yagom is Student
result = yagom is UniversityStudent

result = hana is Person
result = hana is Student
result = hana is UniversityStudent

result = jason is Person
result = jason is Student
result = jason is UniversityStudent

var mike: Person = UniversityStudent() as Person
var jenny: Student = Student()
var jina: Any = Person() //as Any

//as? as!
var optionalCasted: Student?

optionalCasted = mike as? UniversityStudent
//optionalCasted = jenny as! UniversityStudent
//optionalCasted = jina as? UniversityStudent
//optionalCasted = jina as? Student

func doSomethingWithSwitch(someone: Person){
    switch someone {
    case is UniversityStudent:
        (someone as! UniversityStudent).goToMT()
    default:
        print ("")
    }
}

func doSomething(someone:Person){
    if let universityStudent = someone as? UniversityStudent {
        universityStudent.goToMT()
    } else if let student = someone as? Student {
        student.goToSchoo()
    } else if let person =  someone as? Person {
        person.breath(Person)
    }
}
