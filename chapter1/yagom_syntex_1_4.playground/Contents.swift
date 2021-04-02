import UIKit
//기본 데이터 타입
//Bool Int UIny Float Double Character String

var someBool: Bool = true
someBool = false
//someBool = 1
//someBool = 0
//스위프트에서 bool타입에 정수는 들어가지 못한다.

var someInt: Int = 10
//someInt = 0.3 ->error

var someUInt: UInt = 100
//Uint는 부호가 없는 정수. -100을 넣으려 하면 에러
//simeUInt = someInt를 하면 에러.... UInt에 Int를 넣으려 하니까
//스위프트는 변수에 괭장히 엄격함

var someFloat: Float = 3.14
someFloat = 3
//정수를 넣어도 에러는 나지 않는다.

var someDouble: Double = 3.14
someDouble = 3
//someDouble = someFloat 하면 에러

var someCharacter: Character = "A"
//큰 따움표 사용, 유니코드를 사용하는 모든 문자 가능
//딱 한글자만 가능.
//someCharacter = "hahaha" ->error

var someString: String = "하하하 ㅋ"
print(someString)
//someString = someCharacter 이것도 에러

