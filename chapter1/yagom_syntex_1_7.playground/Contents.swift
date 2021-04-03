import UIKit

//함수의 선언
//func 함수이름(매개변수이름: 타입, ~~~) -> 반환 타입 {
//함수 구현
//return 반환값
//}

func sum(a: Int, b: Int) -> Int{
    return a+b
}

//반환 값이 없을 떄
func printMyName(name: String) -> Void {
    print(name)
}

//매개변수가 없을 떄
func maximumIntegerValue() -> Int {
    return Int.max
}

//기본값을 가지는 매개변수는 매개변수 목록 중에 뒤쪽에 위치하게 한다.
//func 함수이름(매개변수이름: 타입, 매개변수이름: 매개변수타입 = 매개변수기본값
func greeting(friend: String, me: String = "Park") {
    print("Hello \(friend)! I'm \(me)")
}

// 매개변수 기본값을 가지는 매개변수는 생략할 수 있습니다
greeting(friend: "hana") // Hello hana! I'm Park
greeting(friend: "john", me: "eric") // Hello john! I'm eric

//전달인자 레이블
//함수를 호출할 때 매개변수의 역할을 좀 더 명확하게 하거나
//함수 사용자의 입장에서 표현하고자 할 때 사용합니다.
//func 함수이름(레이블 이름: 타입){
//함수구현
//return
//}
func greeting(to friend: String, from me: String){
    print("Hello \(friend)! I'm \(me)")
}
//함수 내부에서 전달인자를 사용할 때에는 매개변수 이름을 사용합니다.


//함수를 호출할 때에는 전달인자 레이블을 사용해야 합니다.
greeting(to:"hana", from: "Park")
//똑같은데 명확히 히려고 이런거 쓰는듯

//가변 매개변수
// 전달 받을 값의 개수를 알기 어려울 때 사용
// 가변 매개변수는 함수당 하나만 사용 가능
//func 함수이름(변수이름:타입, 변수이름: 타입...)->반환타입


func sayHelloToFriends(me: String, friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)!"
}
print(sayHelloToFriends(me: "yagom", friends: "hana", "eric", "wing"))
// Hello ["hana", "eric", "wing"]! I'm yagom!
print(sayHelloToFriends(me: "yagom"))
// Hello []! I'm yagom!

//데이터 타입으로서의 함수

// 스위프트는 함수형 프로그래밍 패러다임을 포함하는 다중 패러다임 언어입니다
// 스위프트의 함수는 일급객체이므로 변수, 상수 등에 저장이 가능하고
// 매개변수를 통해 전달할 수도 있습니다


//함수의 타입표현
//반환 타입 생략 불가
var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction("eric", "yagom") // Hello eric! I'm yagom
someFunction = greeting(friend:me:)
someFunction("eric", "yagom") // Hello eric! I'm yagom

// 타입이 다른 함수는 할당할 수 없습니다
//someFunction = sayHelloToFriends(me: friends:)

func runAnother(function: (String, String) -> Void) {
    function("jenny", "mike")
}

// Hello jenny! I'm mike
runAnother(function: greeting(friend:me:))

// Hello jenny! I'm mike
runAnother(function: someFunction)
