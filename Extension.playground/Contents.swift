extension Int {
    var isEvne: Bool {
        return self % 2 == 0
    }
    
    var isOdd: Bool {
        return self % 2 == 1
    }
    
    func multiply(by n: Int) -> Int{
        return self * n
    }
}

print (1.isEvne)
print (2.isOdd)

extension String {
    init(intTypeNumber: Int){
        self = "\(intTypeNumber)"
    }
    
    init (doubleTypeNumber: Double) {
        self = "\(doubleTypeNumber)"
    }
}

let stringFromInt: String = String(intTypeNumber: 100)
let stringFromDouble: String = String(doubleTypeNumber: 100.0)
