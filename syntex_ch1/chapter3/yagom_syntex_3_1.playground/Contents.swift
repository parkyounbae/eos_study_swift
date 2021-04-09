import UIKit

//오류 처리
//Error라는 프로토콜을 준수하는 타입의 값을 통해 표현
//Error프로토콜은 요구사항이 없는 빈 프로토콜이지만, 오류를 표현하기 위한 타입(주로 열거)은 이 프로토콜을 채택
//스위프트의 열거형은 오류의 종류를 나타내기에 아주 적합

/*
 enum 오류종류이름 : Error {
    case 종류1
    case 종류2
    ...
 }
 */

//오류표현
//Error프로토콜과 열거형을 통해 오류를 표현
//자판기 동작오류를 표현한 열거형 오류
enum VendingMachineError: Error {
    case invalidInput
    case insufficientFunds(moneyNeeded: Int)
    case outOfStock
}

//함수에서 발생한 오류 던지기
//함수 동작 중에 발생한 오류를 던지는 메서드 구현
//오류 발생의 여지가 있는 메서드는 throws를 시용해 오류발생 가능성이 있다는 것을 표시
class VendingMachine {
    let itemPrice: Int = 100
    var itemCount: Int = 5
    var deposited: Int = 0
    
    // 돈 받기 메서드
    func receiveMoney(_ money: Int) throws { //여기서 언더바는 무슨역할? : 와일드카드 식별자
        //와일드카드 식별자 -> 이 자리에 무엇이든지 와도 가능
        
        // 입력한 돈이 0이하면 오류를 던집니다
        guard money > 0 else {
            throw VendingMachineError.invalidInput
        }
        
        // 오류가 없으면 정상처리를 합니다
        self.deposited += money
        print("\(money)원 받음")
    }
    
    // 물건 팔기 메서드
    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
        
        // 원하는 아이템의 수량이 잘못 입력되었으면 오류를 던집니다
        guard numberOfItemsToVend > 0 else {
            throw VendingMachineError.invalidInput
        }
        
        // 구매하려는 수량보다 미리 넣어둔 돈이 적으면 오류를 던집니다
        guard numberOfItemsToVend * itemPrice <= deposited else {
            let moneyNeeded: Int
            moneyNeeded = numberOfItemsToVend * itemPrice - deposited
            
            throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
        }
        
        // 구매하려는 수량보다 요구하는 수량이 많으면 오류를 던집니다
        guard itemCount >= numberOfItemsToVend else {
            throw VendingMachineError.outOfStock
        }
        
        // 오류가 없으면 정상처리를 합니다
        let totalPrice = numberOfItemsToVend * itemPrice
        
        self.deposited -= totalPrice
        self.itemCount -= numberOfItemsToVend
        
        return "\(numberOfItemsToVend)개 제공함"
    }
}

// 자판기 인스턴스
let machine: VendingMachine = VendingMachine()

// 판매 결과를 전달받을 변수
var result: String?


//오류처리
/*
 오류를 던질 수도 있지만 오류가 던져지는 것에 대비하여 던져진 오류를 처리하기 위한 코드도 작성해야 합니다...
 (오류 판단해서 문제 해결 유도, 다른 방법으로 시도 등등...)
 오류발생의 여지가 있는 throws 함수는 try를 사용하여 호출해야함
 try, do-catch, try?, try!
 */

//do-catch
//오류발생의 여지가 있는 throws함수는 do-catch 구문을 활용하여 오류발생에 대비
do {
    try machine.receiveMoney(0)
} catch VendingMachineError.invalidInput {
    print("입력이 잘못되었습니다")
} catch VendingMachineError.insufficientFunds(let moneyNeeded) {
    print("\(moneyNeeded)원이 부족합니다")
} catch VendingMachineError.outOfStock {
    print("수량이 부족합니다")
} // 입력이 잘못되었습니다

//하나의 catch 블럭에서 switch 구문을 사용하여 오류를 분류
do {
    try machine.receiveMoney(300)
} catch /*(let error)*/ { //암시적으로 받음
    
    switch error { //던져진 에러를 받음
    case VendingMachineError.invalidInput:
        print("입력이 잘못되었습니다")
    case VendingMachineError.insufficientFunds(let moneyNeeded):
        print("\(moneyNeeded)원이 부족합니다")
    case VendingMachineError.outOfStock:
        print("수량이 부족합니다")
    default:
        print("알수없는 오류 \(error)")
    }
} // 300원 받음

//케이스별로 오류처리 할 필요가 없으면 catch 구문 내부를 간략화 해도 무방
do {
    result = try machine.vend(numberOfItems: 4)
} catch {
    print(error)
} // insufficientFunds(100)﻿

//케이스별로 오류처리 할 필요가 없으면 do 구문만 써도 무방
do {
    result = try machine.vend(numberOfItems: 4)
}

//try?, try!
//try?
//별도의 오류처리 결과를 통보받지 않고 오류가 발생했으면 nil을 돌려받는다.
//정상동작하면 옵셔널 타입으로 정상 반환값을 돌려 받는다.
result = try? machine.vend(numberOfItems: 2)
result // Optional("2개 제공함")

result = try? machine.vend(numberOfItems: 2)
result // nil

//try!
//오류가 발생하지 않는다고 강력한 확신을 가질 때
//정상동작 후에 결과값 받음
//오류시 런타임 오류 발생하고 동작 중지
result = try! machine.vend(numberOfItems: 1)
result // 1개 제공함

//result = try! machine.vend(numberOfItems: 1)
// 런타임 오류 발생!
