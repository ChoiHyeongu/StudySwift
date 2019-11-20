import Swift

protocol Talkable {
    var topic: String {get set }
    var language: String {get set}
    
    func talk()
    
    init(topic: String, language: String)
}

struct Person: Talkable {
    
    var topic: String
    var language: String
    
    init(topic: String, language: String) {
        self.topic = topic
        self.language = language
    }
    var subject: String = ""
    
//    var topic: String {
//        set{
//            self.subject = newValue
//        }
//
//        get{
//            return self.subject
//        }
//    }
    
    func talk() {
        print ("Talk")
    }
}
