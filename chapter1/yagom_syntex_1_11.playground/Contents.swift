import UIKit

//옵셔널 optional
//값이 있을수도 없을수도 있는 것
//옵셔널로 선언된 곳에서만 nil을 할당할 수 있다.
//함수에서 매개변수를 굳이 넘기지 않아도 될 경우에 매개변수의 타입을 옵셔널로 정의 할 수 있다.
//옵셔널이 필요한 이유 -> nil의 가능성을 명시적으로 표현
//전달받은 값이 옵셔널이 아니라면 nil체크를 하지 않더라도 안심하고 사용

//옵셔널이 명시됨
func someFunction(someOptionalParam: Int?){
    //...
}

//옵셔널이 명시되지 않음
func someFunction(someParam: Int){
    //...
}

someFunction(someOptionalParam: nil)
//someFunction(someParam: nil) error
//옵셔널이 아닌 타입에서는 nil을 보낼 수 없다.

//옵셔널은 열거형과 제너럴의 합
/*
enum Optional<Wrapped>: ExpressibleByNiliteral {
         case none
         case some(Wrapped)
}

let optionalValue: Optional<Int> = nil
let optionalValue: Int? =nil
 */


//느낌표 사용 : 암시적 추출 옵셔널
// Implicitly Unwrapped Optional
var implicitlyUnwrappedOptionalValue: Int! = 100

switch implicitlyUnwrappedOptionalValue {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}

// 기존 변수처럼 사용 가능
implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1

// nil 할당 가능
implicitlyUnwrappedOptionalValue = nil

// 잘못된 접근으로 인한 런타임 오류 발생
//implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1
//옵셔널에 nil을 넣었는데 접근하려 하니까 오류


// Optional

var optionalValue: Int? = 100
//인트값이 있을수도... 없을수도....

switch optionalValue {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}

// nil 할당 가능
optionalValue = nil

// 기존 변수처럼 사용불가 - 옵셔널과 일반 값은 다른 타입이므로 연산불가
//optionalValue = optionalValue + 1
