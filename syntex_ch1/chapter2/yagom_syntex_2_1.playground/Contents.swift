import UIKit

//구조체
//struct 이름 {
//구현부
//}


//구조체 프로퍼티 및 메서드 구현
struct Sample {
    //가변 프로퍼티 (값 변경 가능)
    var mutableProperty: Int = 100
    
    //불변 프로퍼시 (값 변경 불가능)
    var immutableProperty: Int = 100
    
    //타입 프로퍼티 (static 키워드 사용 : 타입 자체가 사용하는 프로퍼티)
    static var typeProperty: Int = 100
    
    //인스턴스 메서드 (인스턴스가 사용하는 메서드)
    func instanceMethod(){
        print("instance method")
    }
    
    //타입 매서드 (static 키워드 사용 : 타입 자체가 사용하는 메서드)
    static func typeMethod(){
        print("type method")
    }
}


//구조체 사용
var mutable: Sample = Sample()
mutable.mutableProperty = 200
//가변 프로퍼티는 인스턴스 생성 후 수정 가능
//불변 프로퍼티는 인스턴스 생성 후 수정 불가능

//불변 인스턴스
let immutable: Sample = Sample()
//불면 인스턴스는 아무리 가변 프로퍼티라도 인스턴스 생성 후에 수정 불가능

//타입 프로퍼티 및 메서드
Sample.typeProperty = 300 //static으로 선언해서 이렇게 가능
Sample.typeMethod() //type method
//타입으로 직접 메소드를 실행

//학생 구조체 만들어 보기
struct Student{
    //가변 프로퍼티
    var name: String = "unknown"
    
    //키워드를 ``로 감싸면 이름으로 사용할 수 있다.
    //저걸로 안 묶어주면 일반적으로 사용하는 키워드로 인식
    var `class`: String = "Swift"
    
    //타입 메서드
    static func selfIntroduce(){
        print("학생입니다.")
    }
    
    //인스턴스 메서드
    //self는 인스턴스 자신을 지칭하며, 몇몇 경우를 제외하고 사용은 선택사항
    func selfIntroduce(){
        print("저는 ₩(self.class)반 ₩(name)입니다.")
    }
}

//타입 메서드 사용
Student.selfIntroduce() //학생입니다.
//static으로 선언이라 이렇게 사용 가능~!

//가변 인스턴스 생성
var park: Student = Student()
park.name = "Park"
park.class = "스위프트"
park.selfIntroduce() //저는 스위프트반 Park입니다.

//불변 인스턴스 생성
let jina: Student = Student()
//불변 인스턴스이므로 프로퍼티 값 변경 불가능
