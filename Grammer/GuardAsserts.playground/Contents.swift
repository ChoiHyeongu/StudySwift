import Swift

var someInt: Int = 0

assert(someInt == 0, "someInt != 0")

func funcWithGuard(age: Int?) {
    guard let unwrappedAge = age,
        unwrappedAge < 130,
        unwrappedAge >= 0 else {
            print("틀림")
            return
    }
    
    print ("당신의 나이는 \(unwrappedAge)")
}

func someFuction(info: [String: Any]) {
    guard let name = info["name"] as? String  else {
        return
    }
}
