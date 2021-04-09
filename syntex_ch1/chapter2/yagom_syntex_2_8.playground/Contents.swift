import UIKit

//프로퍼티 갑시자
//프로퍼티의 값이 변경될 때 원하는 동작을 수행할 수 있다.
//값이 변경되기 직전에 willSet블럭이 변경 된 직후에 didSet블럭 호출
//둘중에 필요한 것만 구현
//변경되는 값이 기존의 값과 같더라고 동작
//각 블럭에 암시적 매개변수 사용 가능
// willSet : newValue, didSet : oldValue
//연산프로퍼티에서는 사용 불가
// 지역, 전역 변수에 모두 사용 가능하다.

struct Money {
    // 프로퍼티 감시자 사용
    //저장 프로퍼티 뒤에 willset, didset블럭 -> 프로퍼티 감시자
    var currencyRate: Double = 1100 {
        willSet(newRate) {
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다")
        }
        
        didSet(oldRate) {
            print("환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다")
        }
    }

    // 프로퍼티 감시자 사용
    var dollar: Double = 0 {
        // willSet의 암시적 매개변수 이름 newValue
        willSet {
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다")
        }
        
        // didSet의 암시적 매개변수 이름 oldValue
        didSet {
            print("\(oldValue)달러에서 \(dollar)달러로 변경되었습니다")
        }
    }

    // 연산 프로퍼티
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
        
        /* 프로퍼티 감시자와 연산 프로퍼티 기능을 동시에 사용할 수 없습니다
        willSet {
            
        }
         */
    }
}

var moneyInMyPocket: Money = Money()

// 환율이 1100.0에서 1150.0으로 변경될 예정입니다
moneyInMyPocket.currencyRate = 1150
// 환율이 1100.0에서 1150.0으로 변경되었습니다

// 0.0달러에서 10.0달러로 변경될 예정입니다
moneyInMyPocket.dollar = 10
// 0.0달러에서 10.0달러로 변경되었습니다

print(moneyInMyPocket.won)
// 11500.0
