import UIKit

//익스텐션
//스위프트의 아주 강력한 기능
//구조체, 클래스, 열거형, 프로토콜 타입에 새로운 가능을 추가 할 수 있는 기능
//기능을 추가하려는 타입의 구현된 소스 코드를 몰라도 타입만 알고 있다면 그 타입의 기능을 확장할 수 있다.

//추가 가능한 기능
//연산 타입 프로퍼티, 연산 인스턴스 프로퍼티
//타입 메서드, 인스턴스 메서드
//이니셜라이저
//서브스크립트
//중첩 타입
//특정 프로토콜을 준수할 수 있도록 기능 추가
//+ 기능 추가는 가능하지만 기능을 재정의할 수는 없다
/*
          상속    익스텐션
확장    수직 확장    수평 확장
사용    클래스 타입    클래스, 구조체, 프로토콜, 제네릭 등 모든 타입
재정의    가능    불가능
 */

//정의
//extension 이름 {
//새로운 기능
//}

//익스텐션은 기존의 타입이 추가적으로 다른 프로토콜을 채택할 수 있도록 확장가능
//extension 타입이름: 프로토콜1, 프로토콜2 .. {
//요구사항 구현
//}

//구현
//연산프로퍼티 구현
//Int 타입에 두 개의 연산 프로퍼티를 추가함
//추가한 연산 프로퍼티는 Int타입의 어떤 인스턴스에도 사용 가능
//인스턴스 연산 프로퍼티를 추가해 줄수도 있고, static 키워드를 사용해 타입연산 추가도 가능
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    var isOdd: Bool {
        return self % 2 == 1
    }
}

print(1.isEven) // false
print(2.isEven) // true
print(1.isOdd)  // true
print(2.isOdd)  // false

var number: Int = 3
print(number.isEven) // false
print(number.isOdd) // true

number = 2
print(number.isEven) // true
print(number.isOdd) // false

//메서드 추가
//메서드 익스텐션을 통해 Int타입에 메서드 추가
//여러 기능을 여러 익스텐션 블록을 나누어 구현해도 문제 없음
//관련된 기능별로 하나의 익스텐션 블록에 묶어주는 것도 좋다.
extension Int {
    func multiply(by n: Int) -> Int {
        return self * n
    }
}
print(3.multiply(by: 2))  // 6
print(4.multiply(by: 5))  // 20

number = 3
print(number.multiply(by: 2))   // 6
print(number.multiply(by: 3))   // 9

//이니셜라이저 추가
//인스턴스를 초기화 할때 초기화에 필요한 다양한 데이터를 전달받을 수 있도록 여러 종류의 이니셜라이저를 만들 수 있다. 타입의 정의부가 아닌 익스텐션을 통해 이니셜라이저를 추가할 수있다.
extension String {
    init(int: Int) {
        self = "\(int)"
    }
    
    init(double: Double) {
        self = "\(double)"
    }
}

let stringFromInt: String = String(int: 100)
// "100"

let stringFromDouble: String = String(double: 100.0)
// "100.0"
