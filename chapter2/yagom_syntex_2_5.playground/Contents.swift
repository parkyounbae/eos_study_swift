import UIKit

//클로저
//클로저는 실행가능한 코드 블럭
//함수와 다르게 이름정의는 필요 없음
//함수는 이름이 있는 클로저
//일급 객체로 전달인자, 변수, 상수등에 저장 및 전달 가능

//기본 클로저 문법
//{ (매개변수 목록) -> 반환타입 in
//  실행 코드
//}

func sumFunction(a: Int, b: Int) -> Int {
    return a+b
}

//sum 이라는 상수에 클로저를 할당
var sum: (Int, Int) -> Int = { (a: Int, b: Int) in
    return a+b
}

let sumResult: Int = sum(1,2) //함수를 사용한 것과 완벽히 같다.
print(sumResult) //3

//함수는 클로저의 일종이므로
//sum 변수에 당연히 함수도 할당 가능
sum = sumFunction(a:b:)

//함수의 전달인자로서의 클로저
//클로저는 주로 함수의 전달인자로 많이 사용
//함수 내부에서 원하는 코드블럭을 실행 할 수 있다.
let add: (Int, Int) -> Int
add = { (a: Int, b: Int) in
    return a+b
}

let substract: (Int, Int) -> Int
substract = { (a: Int, b: Int) in
    return a-b
}

let divide: (Int, Int) -> Int
divide = { (a: Int, b: Int) in
    return a/b
}

//calculate라는 함수의 매개변수가 클로저이다.
func calculate(a: Int, b: Int, method: (Int,Int)-> Int) -> Int{
    return method(a,b)
}

var calculated: Int

calculated = calculate(a: 50, b: 10, method: add)
print(calculated) //60

calculated = calculate(a: 50, b: 10, method: substract)
print(calculated) //40

calculated = calculate(a: 50, b: 10, method: divide)
print(calculated) //5

//따로 클로저를 상수 변수에 넣어 전달하지 않고,
//함수를 호출할 때 클로저를 작성하여 전달할 수도 있습니다.
//클로저의 이름을 넣는 대신에 바로 클로저를 때려박음;;;;
calculated = calculate(a: 50, b: 10, method: { (left: Int, right: Int) -> Int in
    return left * right
})

print(calculated) // 500
