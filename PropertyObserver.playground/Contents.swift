import Swift

struct Money {
    var currencyRate: Double = 1100 {
        willSet(newRate){
            print ("환율이 \(currencyRate)에서 \(newRate)로 변경될 예정입니다.")
        }
        
        didSet(oldSet){
            print ("환율이 \(oldSet)에서 \(currencyRate)로 변경되었습니다.")
        }
    }
    
    var dollar: Double = 1100 {
        willSet{
            print ("환율이 \(dollar)에서 \(newValue)로 변경될 예정입니다.")
        }
        
        didSet{
            print ("환율이 \(oldValue)에서 \(dollar)로 변경되었습니다.")
        }
    }
    
    var won:Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
    }
}

var moneyImMyPocket: Money = Money()
moneyImMyPocket.currencyRate = 1150
moneyImMyPocket.dollar = 10
print(moneyImMyPocket.won)
