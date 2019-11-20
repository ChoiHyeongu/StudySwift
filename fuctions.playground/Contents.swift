import Swift

func sum(a: Int, b: Int) -> Int {
    return a + b
}

func printName(name: String) -> Void {
    print ("My name is \(name).")
}

func hello() -> Void { print ("HI")}

sum (a: 3, b: 5)
printName(name: "HIHIHI")

func greeting(friend: String, me: String = "Choi") {
    print ("Hello \(friend)! I am \(me)")
}

func greeting(to friend: String, from me:String){
    print ("Hello \(friend)! I am \(me)")
}

greeting(to: "haha", from: "choi")

func sayHiToFriends(me: String, friends: String...) -> String{
    return "Hello \(friends)"
}

print (sayHiToFriends(me: "Choi", friends: "a","b","c"))

var someFunc: (String, String) -> Void = greeting(to:from:)
someFunc("A", "B")

