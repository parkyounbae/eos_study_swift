import UIKit

//옵셔널 추출
//옵셔널을 추출하는 방법
//1.옵셔널 바인딩
//nil체크 + 안전한 값 추출
/*
 일반적으로 값을 선언하면 그냥 있는건데 옵셔널 체크를 하면 그 값이
 열거형 타입으로 보호되는 상자 속에 들어가 있다고 생각 nil도 마찬가지
 바인딩은 상자에게 물어보는 것 -> 안에 값이 있습니까?
 있으면 꺼내고 없으면 지나감
 */

func printName( name: String){
    print(name)
}

var myName: String? = nil

//printName(myName)
//전달되는 값의 타입이 다르기 때무에 컴파일 오류 발생
//옵셔널은 다른 타입과 다르게 취급

if let name: String = myName{
    printName(name: name) //name은 이 브라켓 안에서만 사용 가능
}else{
    print("myName == nil")
}

//한번에 하나씩이 아닌 여러 옵션을 바인딩 가능함 ... 쉼표 사용하자
var myName2: String? = "yagom"
var yourName: String? = nil

if let name = myName2, let friend = yourName {
    print("\(name) and \(friend)")
}
//yourName이 nil이기 때문에 실행되지 않는다.

yourName = "hana"

if let name=myName2, let friend = yourName {
    print("\(name) and \(friend)")
}
//여기서는 Nil이 아니기 때문에 실행된다~


//옵셔널 값을 강제로 추출해버림
//이건 물어보는게 아니라 걍 상자 부셔버림

printName(name: myName2!)
//강제로 추출된 값이 나와버림

//안에 nil값이 들어있으면 에러
var forceName: String! = nil
//강제추출을 가정한다면 느낌표를 붙여서 선언
