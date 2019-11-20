import Swift

class Person {
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String){
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard` : Person?
    var owner: Person?
    
    init(dong: String, ho:String){
        buildingNumber = dong
        roomNumber = ho
    }
}

let yagom: Person? = Person(name: "yagom")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: Person? = Person(name: "superman")

func guardJob(owner: Person?){
    if let guardJob = owner?.home?.guard?.job{
        print (guardJob)
    } else {
        print ("직업 없음")
    }
}

var guardJob: String

guardJob = yagom?.home?.guard?.job ?? "슈퍼맨"
print (guardJob)

yagom?.home?.guard?.job = nil
