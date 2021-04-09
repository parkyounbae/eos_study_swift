import UIKit

//assert / guard
//Assertion
//assert(_:_:file:line:) 함수를 사용
//디버깅 모드에서만 동작, 배포하는 애플리케이션에서는 제외
//예상했던 조건의 검증을 위하여 사용
var someInt: Int = 0

// 검증 조건과 실패시 나타날 문구를 작성해 줍니다
// 검증 조건에 부합하므로 지나갑니다
assert(someInt == 0, "someInt != 0")

someInt = 1
//assert(someInt == 0) // 동작 중지, 검증 실패
//assert(someInt == 0, "someInt != 0") // 동작 중지, 검증 실패
// assertion failed: someInt != 0: file guard_assert.swift, line 26


func functionWithAssert(age: Int?) {
    
    assert(age != nil, "age == nil")
    
    assert((age! >= 0) && (age! <= 130), "나이값 입력이 잘못되었습니다")
    print("당신의 나이는 \(age!)세입니다")
}

functionWithAssert(age: 50)
//functionWithAssert(age: -1) // 동작 중지, 검증 실패
//functionWithAssert(age: nil) // 동작 중지, 검증 실패
//precondition(_:_:file:line:)은 실제 배포 환경에서도 동작한다.

//guard 빠른 종료
//잘못된 값의 전달 시 특정 실행 구문을 빠르게 종료한다.
//어떤 조건에서도 동작
//guard의 else 블럭 내부에는 코드블럭을 종료하는 지시어(return, break)가 곡 있어야 한다.
func functionWithGuard(age: Int?) {
    
    guard let unwrappedAge = age, //먼저 나이를 언래핑
        unwrappedAge < 130,
        unwrappedAge >= 0 else { //가드에는 else가 무조건
        print("나이값 입력이 잘못되었습니다")
        return//리턴도 무조건
    }
    
    print("당신의 나이는 \(unwrappedAge)세입니다")
}

var count = 1
//함수 뿐만 아니라 반복문 안에서도 사용 가능
while true {
    guard count < 3 else {
        break
    }
    print(count)
    count += 1
}
// 1
// 2

func someFunction(info: [String: Any]) {
    guard let name = info["name"] as? String else {
        //name에 해당하는 값이 String으로 다운캐스팅이 불가능 할때
        return
    }
    
    guard let age = info["age"] as? Int, age >= 0 else {
        //age에 해당하는 값이 Int로 다운캐스팅이 불가능하거나 0보다 작을때
        return
    }
    //위의 조건을 다 통과한다면 print함수 실행가능
    print("\(name): \(age)")
}

someFunction(info: ["name": "jenny", "age": "10"])
someFunction(info: ["name": "mike"])
someFunction(info: ["name": "yagom", "age": 10]) // yagom: 10

//if / guard 옵셔널 바인딩 비교

func optionalFuncWithGuard(someValue: Int?){
    // 1. if let 옵셔널 바인딩
    if let unwrapped: Int = someValue {
    // do something
        //if 문 안에서만 사용 가능
       print(unwrapped)
    }
    // if 구문 외부에서는 unwrapped 사용이 불가능 합니다.
    // unwrapped = 5

    // 2. guard 옵셔널 바인딩
    // gaurd 구문 이후에도 unwrapped 사용 가능합니다.
    guard let unwrapped: Int = someValue else {
        
        return
    }
    //가드문 밖에서만 사용 가능
    print(unwrapped) //guard문에 있는 unwrapped에 접근 가능
//함수를 실행할 때 함수 실행 조건에 맞지 않는다면 그냥 내쳐버림~~
}

