import UIKit

//인스턴스 생성/소멸 (init, deinit)
//인스턴스를 생성하는 이니셜라이저와 클래스의 인스턴스가 소멸될 때 호출하는 다이니셜라이저
//스위프트의 모든 인스턴스는 초기회와 동시에 모든 프로퍼티에 유효한 값이 할당되어 있어야 합니다.
//프로퍼티에 미리 기본값을 할당해두면 인스턴스가 생성됨과 동시에 초기값을 지니게 된다.

class PersonA {
    // 모든 저장 프로퍼티에 기본값 할당
    //초기값이 지정되어있지 않다면 오류 발생
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
    var nickName: String? // 이 프로퍼티는 곡 필요한 프로퍼티가 아닙니다.
    
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }

// 위와 동일한 기능 수행
    //self.name = name
    //self.age = age 이 중복되는 부분을 줄이기 위해서
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

class Puppy {
    var name: String
    var owner: PersonC!
    //암시적 추출 옵셔널은 인스턴스 사용에 꼭 필요하지만 초기값을 할당하지 않고자 할 때 사용
    //init할때 전달되기 어려운 값들
    
    init(name: String) {
        self.name = name
    }
    
    func goOut() {
        print("\(name)가 주인 \(owner.name)와 산책을 합니다")
    }
}

let happy: Puppy = Puppy(name: "happy")
//happy.goOut() // 주인이 없는 상태라 오류 발생
happy.owner = jenny
happy.goOut()
// happy가 주인 jenny와 산책을 합니다


//실패가능한 이니셜라이저
//초기값이 잘못된 경우 인스턴스 생성에 실패할 수 있다.
//인스턴스 생성에 실패하면 nil을 반환합니다.
//실패 가능한 이니셜라이저의 반환타입은 옵셔널 타입
//init?을 사용한다.

class PersonD {
    var name: String
    var age: Int
    var nickName: String?
    
    init?(name: String, age: Int) {
        if (0...120).contains(age) == false {
            return nil
        }
        
        if name.count == 0 {
            return nil
        }
        
        self.name = name
        self.age = age
    }
}

//let john: PersonD = PersonD(name: "john", age: 23)
//실패가능한 이니셜라이져 이기때문에 옵셔널 타입에 할당해주어야 한다.
let john: PersonD? = PersonD(name: "john", age: 23)
let joker: PersonD? = PersonD(name: "joker", age: 123)
let batman: PersonD? = PersonD(name: "", age: 10)

print(joker) // nil
print(batman) // nil


//디이니셜라이저
//deinit는 클래스의 인스턴스가 메모리에서 해제되는 시점에 호출된다.
//인스턴스가 해제되는 시점에 해야할 일을 구현할 수 있다.
//deinit은 매개변수를 지닐 수 없다.
//자동으로 호출되므로 직접 호출 할 수 없다.
//클래스 타입에서만 구현 가능
class PersonE {
    var name: String
    var pet: Puppy?
    var child: PersonC
    
    init(name: String, child: PersonC) {
        self.name = name
        self.child = child
    }
    
    // 인스턴스가 메모리에서 해제되는 시점에 자동 호출
    deinit {
        if let petName = pet?.name {
            print("\(name)가 \(child.name)에게 \(petName)를 인도합니다")
            self.pet?.owner = child
        }
    }
}

var donald: PersonE? = PersonE(name: "donald", child: jenny)
donald?.pet = happy
donald = nil // donald 인스턴스가 더이상 필요없으므로 메모리에서 해제됩니다
// donald가 jenny에게 happy를 인도합니다
