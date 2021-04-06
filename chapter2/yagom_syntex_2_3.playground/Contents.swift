import UIKit

//열겨형
//유사한 종류의 여러 값을 한 곳에 모아 정의한 것
//enum자체가 하나의 데이터 타입으로 대문자 시작
//case들은 그 자체가 고유의 값
//enum 이름 {
//  case 이름1
//  case 이름2
//  case 이름3,이름4,이름5
//}

//열거형 사용
enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

//열거형 타입과 케이스를 모두 사용하여도 됩니다.
var day: Weekday = Weekday.mon
//var day = .mon 이러면 무슨 타입인지 몰라서 에러
//처음 선언 할때에는 꼭 타입 명시해주어야 한다.

//타입이 명확하다면 .case 처럼 표현해도 무방합니다.
day = .tue

print(day) //tue

//switch문 비교값에 열거형이 위치할 때
//모든 열거형 케이스를 포함한다면 default를 작성할 필요가 없다.
//하나라도 빠지면 default구현해야한다.
switch day {
case .mon,.tue,.wed,.thu:
    print("평일입니다.")
case Weekday.fri:
    print("불금!!!!")
case .sat, .sun:
    print("주말이다다다다다다다")
}

//rawValue(원시값)
//c언어의 enum 처럼 정수값을 가질 수 있습니다.
//case 별로 다른 값을 가져야 합니다.
//자동으로 1이 증가된 값이 할당된다.
//rawValue를 반드시 지닐 필요가 없다면 굳이 만들지 않아도 된다.
enum Fruit: Int{
    case apple = 0
    case grape = 1
    case peach //2
}

print(Fruit.peach.rawValue) //2

//정수 타입 뿐만 아닌 Hashable프로토콜을 따르는 모든 타입을 저장 가능
enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}

print(School.middle.rawValue)
//중등

// 열거형의 원시값 타입이 String일 때, 원시값이 지정되지 않았다면
// case의 이름을 원시값으로 사용합니다
print(School.university.rawValue)
//university


//원시값을 통한 초기화
//rawValue를 통해 초기화 할 수 있다.
//rawValue가 case에 해당하지 않을 수 있으므로, rawValue를 토해 초기화 한
//인스턴스는 옵셔널 타입이다.
// rawValue를 통해 초기화 한 열거형 값은 옵셔널 타입이므로 Fruit 타입이 아닙니다
//let apple: Fruit = Fruit(rawValue: 0)
let apple: Fruit? = Fruit(rawValue: 0)

// if let 구문을 사용하면 rawValue에 해당하는 케이스를 곧바로 사용할 수 있습니다
if let orange: Fruit = Fruit(rawValue: 5) {
    print("rawValue 5에 해당하는 케이스는 \(orange)입니다")
} else {
    print("rawValue 5에 해당하는 케이스가 없습니다")
} // rawValue 5에 해당하는 케이스가 없습니다


enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage() {
        switch self {
        case .mar, .apr, .may:
            print("따스한 봄~")
        case .jun, .jul, .aug:
            print("여름 더워요~")
        case .sep, .oct, .nov:
            print("가을은 독서의 계절!")
        case .dec, .jan, .feb:
            print("추운 겨울입니다")
        }
    }
}

Month.mar.printMessage()
