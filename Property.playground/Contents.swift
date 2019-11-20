import Swift

struct Student{
    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge: Int = 0
    
    var westernAge: Int {
        get {
            return koreanAge - 1
        }
        
        set (inputValue) {
            koreanAge = inputValue + 1
        }
    }
    
    static var typeDescription: String = "Student"
    
    var selfIntroduce: String {
        get{
            return "저는 \(name) 입니다."
        }
    }
    
    static var selfIntro: String {
        return "학생타입입니다."
    }
}

print (Student.selfIntro)

var choi:Student = Student()
choi.koreanAge = 10
print (choi.westernAge)

struct Money {
    var curecyRate: Double = 1100
    var dollar: Double = 0
    var won: Double {
        get {
            return dollar * curecyRate
        }
        set {
            dollar = newValue / curecyRate
        }
    }
}

var moneyInMyPockeet = Money()
moneyInMyPockeet.won = 11000
moneyInMyPockeet.dollar = 10
print (moneyInMyPockeet.won)

var a: Int = 3
var b: Int = 4

var sum: Int {
    return a + b
}

print (sum)
