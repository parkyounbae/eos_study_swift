import UIKit

//스위프트의 프로토콜
//다른 언어의 추상클래스 혹은 인터페이스와 유사

//특정 역할을 수행하기 위한 메서드, 프로퍼티, 기타 요구사항 등의 청사진을 정의
//구조체, 클래스, 열거형은 프로토콜의 채택해서 특정 기능을 수행하기 위한 프로토콜의 요구사항을 실제로 구현할 수 있다.
//어떤 프로토콜의 요구사항을 모두 따르는 타입은 그 프로토콜을 준수한다고 표현
//프로토콜의 요구사항을 충족시키려면 제시하는 청사진의 기능을 모두 구현해야 한다.
//... 프로토콜을 기능을 정의하고 제시할 뿐 스스로 기능을 구현하는건 아니다.

//protocol 프로토콜이름 {
// 구현
//}

//구현
//프로퍼티 요구는 항상 varzldnjemfmf tkdyd
//get은 읽기만 가능해도 노상관, get+set은 읽기 쓰기 모두 가능한 프로퍼티..
protocol Talkable {
    
    // 프로퍼티 요구
    var topic: String { get set }
    var language: String { get }
    
    // 메서드 요구
    func talk()
    
    // 이니셜라이저 요구
    init(topic: String, language: String)
}

//프로토콜 채택 및 준수
// Person 구조체는 Talkable 프로토콜을 채택했습니다
struct Person: Talkable {
    // 프로퍼티 요구 준수
    var topic: String
    let language: String //읽기 전용이라 let선언 가능하다
    
// 읽기전용 프로퍼티 요구는 연산 프로퍼티로 대체가 가능합니다
//  var language: String { return "한국어" }
    
// 물론 읽기, 쓰기 프로퍼티도 연산 프로퍼티로 대체할 수 있습니다
//    var subject: String = ""
//    var topic: String {
//        set {
//            self.subject = newValue
//        }
//        get {
//            return self.subject
//        }
//    }
    
    // 메서드 요구 준수
    func talk() {
        print("\(topic)에 대해 \(language)로 말합니다")
    }

    // 이니셜라이저 요구 준수
    init(topic: String, language: String) {
        self.topic = topic
        self.language = language
    }
}
//프로퍼티 요구는 다양한 방법으로 해석, 구현할 수 있다.
struct SecondPerson: Talkable {
    var subject: String = ""

    // 프로퍼티 요구는 연산 프로퍼티로 대체가 가능합니다
    var topic: String {
        set {
            self.subject = newValue
        }
        get {
            return self.subject
        }
    }
    
    var language: String { return "한국어" }
    
    func talk() {
        print("\(topic)에 대해 \(language)로 말합니다")
    }
    init(topic: String, language: String) {
        self.topic = topic
    }
}

//프로토콜의 상속
//하나 이상의 프로토콜을 상속받아 기존 프로토콜의 요구사항보다 더 많이 요구 가능
//클래스의 상속 문법과 유사한데 다중상속 가능

//protocol 이름 : 부모이름목록 {
//정의
//}

protocol Readable {
    func read()
}
protocol Writeable {
    func write()
}
protocol ReadSpeakable: Readable {
    func speak()
}
protocol ReadWriteSpeakable: Readable, Writeable {
    func speak() //읽기, 쓰기도 포함~!
}

struct SomeType: ReadWriteSpeakable {
    //3가지 모두 구현해주어야 한다.
    func read() {
        print("Read")
    }
    func write() {
        print("Write")
    }
    func speak() {
        print("Speak")
    }
}

//클래스에서 상속과 프로토콜 채택을 동시에 하려면 상속받으려는 클래스를 먼저 명시하고 그 뒤에 채택할 프로토콜 목록을 작성
class SuperClass: Readable {
    func read() { }
}

class SubClass: SuperClass, Writeable, ReadSpeakable {
    //read는 부모클래스에 구현되어있다!!
    func write() { }
    func speak() { }
}

//프로토콜 준수 확인
//is, as 연산자를 사용해서 인스턴스가 특정 프로토콜을 준수하는지 확인할 수 있습니다.
let sup: SuperClass = SuperClass()
let sub: SubClass = SubClass()

var someAny: Any = sup
someAny is Readable // true
someAny is ReadSpeakable // false

someAny = sub
someAny is Readable // true
someAny is ReadSpeakable // true

someAny = sup //업 캐스팅

if let someReadable: Readable = someAny as? Readable {
    //애니 타입이니까 캐스팅 하고 언래핑
    someReadable.read()
} // read

if let someReadSpeakable: ReadSpeakable = someAny as? ReadSpeakable {
    someReadSpeakable.speak()
} // 동작하지 않음

someAny = sub

if let someReadable: Readable = someAny as? Readable {
    someReadable.read()
} // read
