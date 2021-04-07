import UIKit

//인스턴스 생성/소멸 (init, deinit)
//인스턴스를 생성하는 이니셜라이저와 클래스의 인스턴스가 소멸될 때 호출하는 다이니셜라이저
//스위프트의 모든 인스턴스는 초기회와 동시에 모든 프로퍼티에 유효한 값이 할당되어 있어야 합니다.
//프로퍼티에 미리 기본값을 할당해두면 인스턴스가 생성됨과 동시에 초기값을 지니게 된다.

class PersonA {
    // 모든 저장 프로퍼티에 기본값 할당
    var name: String = "unknown"
    var age: Int = 0
    var nickName: String = "nick"
}

// 인스턴스 생성
let jason: PersonA = PersonA()

// 기본값이 인스턴스가 지녀야 할 값과 맞지 않다면
// 생성된 인스턴스의 프로퍼티에 각각 값 할당
// 여기서 할당 안하면 기본 프로퍼티 값
jason.name = "jason"
jason.age = 30
jason.nickName = "j"


//이니셜라이져
//프로퍼티의 초기값을 일일히 지정하기 귀찮으니까 init을 통해 인스턴스가 가져야 할 초기값 전달
class PersonB {
    var name: String
    var age: Int
    var nickName: String
    
    // 이니셜라이저
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}
let hana: PersonB = PersonB(name: "hana", age: 20, nickName: "하나")


//프로퍼티의 초기값이 곡 필요 없을 때
//옵셔널 사용, class내부의 init을 사용할 때에는 convenience를 사용
class PersonC {
    var name: String
    var age: Int
    var nickName: String?
    
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }

// 위와 동일한 기능 수행
// convenience init(name: String, age: Int, nickName: String) {
//       init(name: name, age: age)
//       self.nickName = nickName
//  }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let jenny: PersonC = PersonC(name: "jenny", age: 10)
let mike: PersonC = PersonC(name: "mike", age: 15, nickName: "m")﻿

