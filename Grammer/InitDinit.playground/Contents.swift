import Swift

class PersonA {
    var name: String
    var age: Int
    var nickName: String?
    
    convenience init(name: String, age: Int, nickName: String) {
        self.init(name: name, age: age)
        self.nickName = nickName
    }
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
}

let hana: PersonA = PersonA(name: "hana", age: 20, nickName: "하나")

class Puppy {
    var name : String
    var owner: PersonA!
    
    init(name: String) {
        self.name = name
    }
    
    func goOut(){
        print ("주인 \(owner.name)와 산책을 합니다.")
    }
}

class PersonD {
    var name: String
    var age: Int
    var nickName: String?
    
    init?(name: String, age: Int){
        
        if (0...120).contains(age) == false {
            return nil
        }
        
        self.name = name
        self.age = age
    }
}

class PersonF {
    var name: String
    var age: Int
    var nickName: String?
    var pet: Puppy
    var child: PersonA
    
    init?(name: String, age: Int){
        
        if (0...120).contains(age) == false {
            return nil
        }
        
        self.name = name
        self.age = age
    }
    
    deinit {
        //if let petName = pet?.name {
            print ("\(name)가 \(child.name)에게 \(petName)을 인도합니다.")
            //self.pet?.owner = child
        }
    }
}


