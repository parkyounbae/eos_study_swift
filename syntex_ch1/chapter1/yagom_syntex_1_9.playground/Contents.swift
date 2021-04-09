import UIKit

//조건문

//if-else 문
//우리가 평소에 사용하는 if문과 동일
//소괄호를 생략 가능하다

var someInteger: Int = 30

if someInteger < 100 {
    print("100 미만")
} else if someInteger > 100 {
    print("100 초과")
} else {
    print("100")
}

//스위프트의 조건에는 항상 bool타입이 들어와야 한다.
//if someInteger { ... } 이러면 에러

//switch 문
//switch value{
//case pattern:
//  code
//default:
//  code
//}

//범위연산자를 사용하면 더 편리하다

switch someInteger {
case 0:
    print("zero")
case 1..<100: //이건 1이상 100 미만이라는 뜻
    print("1~99")
case 100:
    print("100")
case 101...Int.max: //100이상 max이하
    print("Over 100")
default:
    print("Unknown")
}

//정수 말고도 기본 타입 사용 가능
switch "Park" {
case "jake":
    print("jake")
case "mina":
    print("mina")
case "Park":
    print("PARK!!!~!")
default:
    print("Unknown")
}
//명시적으로 break를 해주지 않아도 알아서 해줌
//기존과 똑같이 ㄷ쓰려면 fallthrough 를 사용해주어야 한다. 
