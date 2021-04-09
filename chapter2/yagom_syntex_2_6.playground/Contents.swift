import UIKit

//클로저 고급
//클로저는 너무 다양한 표현법이 있기 때문에 남들이 알아보기 쉽게 써야한다.
/*
 1. 후행 클로저 : 함수의 매개변수 마지막으로 전달되는 클로저는 후행클로저로 함수 밖에 구현할 수 있다.
 2. 반환타입 생략 : 컴파일러가 클로저의 타입을 유추할 수 있는 경우 매개변수, 반환 타입을 생략 할 수 있습니다.
 3. 단축 인자 이름 : 전달인자의 이름이 굳이 필요없고, 컴파일러가 타입을 유추할 수 있는 경우 축양된 전달인자 이름(&0,$1 ...)을 사용할 수 있다.
 4. 암시적 반환 표현 : 반환 값이 있는 경우, 암시적으로 클로저의 맨 마지막 줄은 return 카워드를 생략하더라도 반환 값으로 취급
 */

//기본 클로저 표현
// 클로저를 매개변수로 갖는 함수 calculated(a:b:method:)와 결과값을 저장할 변수 result 선언
func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b)
}

var result: Int


//후행 클로저 : 클로저가 함수의 마지막 전달인자일때, 마지막 매개변수의 이름을 생략한 후 함수 소괄호 외부에 클로저를 구현할 수 있습니다.
//괄호가 간략해져서 헷갈리지 않을듯
result = calculate(a: 10, b: 10) { (left: Int, right: Int) -> Int in
    return left + right
}

print(result) // 20

//반환타입 생략
//calculate함수의 매개변수 method가 Int를 반환할 것이라는 사실을 컴파일러도 알기 때문에 클로저에서 반환타입을 명시해주지 않아도 된다. 단 in키워드는 생략할 수 없다.
result = calculate(a: 10, b: 10, method: {(left: Int, right: Int) in
    return left + right
})

//단축 인자이름
//클로저의 매개변수 이름이 불필요 하다면 단축 인자이름을 활용할 수 있다. 단축 인자 이름은 클로저의 매개변수 순서대로 $0, $1, $2 ... 처럼 표현합니다.
result = calculate(a: 10, b: 10, method: {
    return $0 + $1
})
print(result) // 20

// 당연히 후행 클로저와 함께 사용할 수 있습니다
result = calculate(a: 10, b: 10) {
    return $0 + $1
}
print(result) // 20


//암시적 반환 표현
//클로저가 반환하는 값이 있다면 클로저의 마지막 줄의 결과값은 암시적으로 반환값으로 취급합니다.
result = calculate(a: 10, b: 10) {
    $0 + $1
}

print(result) // 20

// 간결하게 한 줄로 표현해 줄 수도 있습니다
result = calculate(a: 10, b: 10) { $0 + $1 }

print(result) // 20