import Swift

enum Weekday{
    case mon
    case tue
    case wed
    case thu
    case fri
    case sat, sun
}

var day: Weekday = Weekday.mon
day = .tue

print (day)

switch day {
case .mon, .tue, .wed, .thu:
    print ("평일")
default:
    print ("금 토 일")
}

enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach
}

print (Fruit.apple.self)

enum School: String {
    case e = "E"
    case m = "M"
    case h = "H"
    case u
    
    func printMessage(){
        switch self {
        case .e:
            print ("abc")
        default:
            print ("defulat")
        }
    }
}

School.e.printMessage()
