import Swift

enum VendingMachineError: Error {
    case invalidInput
    case insufficientFunds(moneyNeeded: Int)
    case outOfStock
}

class VendingMachine {
    let itemPrice: Int = 100
    let itemCount: Int = 5
    var deposited: Int = 5
    
    func receiveMoney(money: Int) throws {
        guard money > 0 else {
            throw VendingMachineError.invalidInput
        }
        
        self.deposited += money
        print("\(money)")
    }
    
    func vend(numberofItems numberofItemsToVend: Int) throws -> String {
        guard numberofItemsToVend > 0 else {
            throw VendingMachineError.invalidInput
        }
        
        return "String"
    }
}

var machine: VendingMachine = VendingMachine()

do {
    try machine.receiveMoney(money: 200)
} catch {
    print ("")
}

do {
    
} catch{
    switch error {
    case VendingMachineError.invalidInput:
        print("")
    default:
        print("")
    }
}

var result: String

do {
    result = try machine.vend(numberofItems: 100)
} catch {
    print (error)
}

result = try? machine.vend(numberofItems: 2)
result = try? machine.vend(numberofItems: 2)

result = try! machine.vend(numberofItems: 1)
