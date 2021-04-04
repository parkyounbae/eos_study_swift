import UIKit

//반복문

var integers = [1,2,3]
let people = ["park":10, "eric":15, "mike":20]

//for_in 구문
//for item in items{
//code
//}

for integer in integers{
    print(integer)
}
//integers배열안에 있는 요소들 주르륵integer에

//딕셔너리의 아이템은 키와 값으로 구성된 튜플
for(name, age) in people{
    print("\(name) : \(age)")
}

//while문
//while문도 마찬가지로 조건부분에 중괄호가 생략될 수 있다.
//while condition {
//  code
//}

while integers.count>1{
    integers.removeLast()
}

//repeat-while
//repeat{
//code
//} while condition

repeat {
    integers.removeLast()
} while integers.count > 0
//먼저 실행하고 와일의 조건을 체크하고 계속 반복

