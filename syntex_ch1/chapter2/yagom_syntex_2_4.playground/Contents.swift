import UIKit

//클래스와 구조체의 비교
//가장 큰 차이 : 클래스는 참조 타입, 구조체와 열거형은 값 타입
//클래스는 상속이 가능하지만 열거형과 구조체는 상속이 불가능

struct ValueType{
    var property = 1
}

class ReferenceType {
    var property = 1
}

//첫 번째 구조체 인스턴스
let firstStructInstance = ValueType()

//두 번째 구조체 인스턴스에 첫 번째 인스턴스 값 복사
var secondStructInstance = firstStructInstance

//두 번째 구조ㅔ 인스턴스 프로퍼티 값 수정
secondStructInstance.property = 2

//두 번째 구조체 인스턴스는 첫 번째 구조체를 똑같이 복사한 별도의 인스턴스
//두 번째 구조체 인스턴스의 프로퍼티 값을 변경해도 첫 번째 구조체의 인스턴스
//에는 영향이 없다.
print(firstStructInstance.property) // 1
print(secondStructInstance.property) //2

// 클래스 인스턴스 생성 후 첫 번째 참조 생성
let firstClassReference = ReferenceType()
// 두 번째 참조 변수에 첫 번째 참조 할당
let secondClassReference = firstClassReference
secondClassReference.property = 2

// 두 번째 클래스 참조는 첫 번째 클래스 인스턴스를 참조하기 때문에
// 두 번째 참조를 통해 인스턴스의 프로퍼티 값을 변경하면
// 첫 번째 클래스 인스턴스의 프로퍼티 값을 변경하게 됨
print(firstClassReference.property)    // 2
print(secondClassReference.property)  // 2

//참조와 값의 차이!!!!!!!!!!!!!

//값 타입인 경우
//데이터를 전달 할 때 값을 복사해서 전달
//연관된 몇몇의 값들을 모아서 하나의 데이터 타입으로 표현하고 싶은 경우
//더운 객체 또는 함수 등으로 전달됭 때 참조가 아닌 복사를 할 경우
//자신을 상속할 필요가 없거나, 다른 타입을 상속 받을 필요가 없는 경우

//참조 타입인 경우
//데이터를 전달할 때 값의 메모리 위치를 전달

//스위프트의 기본 데이터 타입은 모두 구조체로 구현
//구조체와 열거를 선호
//Apple프레임워크는 대부분 클래스 사용
//선택은 개발자의 몫
