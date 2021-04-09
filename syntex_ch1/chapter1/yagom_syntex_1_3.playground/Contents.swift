import Swift

//변수와 상수
//스위프트는 불변객체를 중요시여김 .. 상수표현을 중요시함
//상수 선언 let 이름: 타입 = 값
//번수 선언 var 이름: 타입 = 값
//이때 띄어쓰기 신경쓰기
//값의 타입이 명확하다면 타입은 생략하는 것도 가능

let constant: String = "변경이 불가능한 상수"
var variable: String = "변경이 가능한 변수"

//constant = "123" -> error
variable = "이렇게 변경이 가능합니다."

//나중에 할당하려는 상수나 변수는 타입을 명시해주어야 한다.
var sum: Int
sum = 20

let result: Int
result = 100
//상수는 최초 한번만 할당 가능

