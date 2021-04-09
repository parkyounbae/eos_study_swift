import Swift

let age: Int = 10

print("안녕하세요 저는 \(age)살입니다.")
//문자열 보간법 -> 문자열 안에 변수 또는 상수 값같은걸 넣고싶을때
print("\n##########\n")

class Person{
    var name: String = "park"
    var age: Int = 20
}

let park: Person = Person()

print(park)

print("\n###########\n")

dump(park)
//dump는 복잡한 구조체 같은걸 출력할 떄 좋다. 
