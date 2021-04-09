import UIKit

//옵셔널 체이님
//옵셔널이 연속적으로 연결되는 경유 유용하게 사용 가능
//매번 nil 확인을 하지 않고 최종적으로 원하는 값이 있는지 없는지 확인 할 수 있다.

// 예제 클래스
// 사람 클래스
class Person {
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String) {
        self.name = name
    }
}
// 사람이 사는 집 클래스
class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?
    
    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}


// 옵셔널 체이닝 사용
let yagom: Person? = Person(name: "yagom")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: Person? = Person(name: "superman")
//생성만 했으므로 옵셔널들은 모두 nil이다.

// 옵셔널 체이닝이 실행 후 결과값이 nil일 수 있으므로
// 결과 타입도 옵셔널입니다

// 만약 우리집의 경비원의 직업이 궁금하다면..?

// 옵셔널 체이닝을 사용하지 않는다면...
func guardJob(owner: Person?) {
    if let owner = owner { //사람이 존재 하는지 안하는지
        if let home = owner.home { //집이 있는지 없는지
            if let `guard` = home.guard {
                if let guardJob = `guard`.job {
                    print("우리집 경비원의 직업은 \(guardJob)입니다")
                } else {
                    print("우리집 경비원은 직업이 없어요")
                }
            }
        }
    }
} //복잡해!!!!!!!!!!!

guardJob(owner: yagom)

// 옵셔널 체이닝을 사용한다면
func guardJobWithOptionalChaining(owner: Person?) {
    if let guardJob = owner?.home?.guard?.job { //이렇게 연결해서 사용
        print("우리집 경비원의 직업은 \(guardJob)입니다")
    } else {
        print("우리집 경비원은 직업이 없어요")
    }
}

guardJobWithOptionalChaining(owner: yagom)
// 우리집 경비원은 직업이 없어요


yagom?.home?.guard?.job // nil
//야곰의 집이 할당되어있지 않아서 nil반환

yagom?.home = apart //집 할당

yagom?.home // Optional(Apartment)
yagom?.home?.guard // nil

// 경비원 할당
yagom?.home?.guard = superman

yagom?.home?.guard // Optional(Person)

yagom?.home?.guard?.name // superman
yagom?.home?.guard?.job // nil

yagom?.home?.guard?.job = "경비원"
//중간에 어디 하나라도 nil이라면 그냥 nil 반환해버림

//nil병합 연산자
//중위 연산자이다. ??
//Optional >> Value
//옵셔널 값이 nil일 경우, 우측의 값을 반환합니다.
//띄어쓰기 주의!!!
var guardJob: String
    
guardJob = yagom?.home?.guard?.job ?? "슈퍼맨"
//앞의 값이 nil이라면 job에 "슈퍼맨"을 넣어달라
print(guardJob) // 경비원

yagom?.home?.guard?.job = nil

guardJob = yagom?.home?.guard?.job ?? "슈퍼맨"
print(guardJob) // 슈퍼맨
