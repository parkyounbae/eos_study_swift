import UIKit

//클래스
//class 이름 {
//구현부
//}


//클래스는 다중 상속이 불가능 하다.
//구조체와 매우 비슷하지만 구조체는 값 타입
//클래스는 참조 타입
class Sample {
    //가변 프로퍼티
    var mutableProperty: Int = 100
    
    //불변 프로퍼티
    var ImmutableProperty: Int = 100
    
    //타입 프로퍼티
    static var typeProperty: Int = 100
    
    //인스턴스 메서드
    func instanceMethod(){
        print("instance method")
    }
    
    //타입 메서드
    // 상속시 재정의 불가 타입 메서드 - static
    static func typeMethod(){
        print("type method - static")
    }
    
    //상속시 재정의 가능 타입 메서드 - class
    class func classMethod(){
        print("type method - class")
    }
    //둘 다 타입인데 키워드에 따라 성질이 달라진다.
}

//인스턴스 생성 - 참조정보 수정 가능
var mutableReference: Sample = Sample()

//가변은 수정 가능~
mutableReference.mutableProperty = 200
//불변 프로퍼티는 생성 후 수정 불가능

//인스턴스 생성 - 참조정보 수정 불가능
let immutableReference: Sample = Sample()

//클래스의 인스턴스는 참조 타입이므로 let으로 선언되었더라도 프로퍼티의 값 변경이 가능
immutableReference.mutableProperty = 200

//참조정보의 변경은 불가능
//immutableProperty = mutableProperty
//참조타입이라도 불변 인스턴스는 생성 후에 변경 할 수 없음
//var로 선언을 했든 let으로 선언을 했든 상관 없이 내부 가변 프로퍼티들은 수정이 가능하다.

//타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() //type method

//인스턴스에서는 타입 프로퍼티나 타입 메서드를 사용할 수 없다.
//mutableReference.typeProperty = 400
//mutableReference.typeMethod()

//학생 클래스 만들어 보기
class Student{
    //가변 프로퍼티
    var name: String = "unknown"
    //구조체와 마찬가지로 ``이걸로 감싸면 키워드도 이름처럼 사용 가능
    var `class`: String = "Swift"
    
    //타입 매서드
    class func selfIntroduce(){
        print("학생입니다.")
    }
    
    //인스턴스 메서드
    //self는 인스턴스 자신을 지칭, 몇몇 경우를 제외하고 사용은 선택 사항
    func selfIntroduce(){
        print("저는 ₩(self.class)반 ₩(name)입니다.")
    }
}


//타입 메서드 사용
Student.selfIntroduce() //학생입니다.

//인스턴스 생성
var park: Student = Student()
park.name = "Park"
park.class = "스위프트"
park.selfIntroduce() //저는 스위프트반 Park입니다.

//인스턴스 생성
let jina: Student = Student()
jina.name = "jina"
jina.selfIntroduce() //저는 Swift반 Jina입니다.
