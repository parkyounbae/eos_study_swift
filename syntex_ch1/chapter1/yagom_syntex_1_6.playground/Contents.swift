import UIKit

//컬렉션 타입
//Array - 순서가 있는 리스트 컬렉션
//Dictionary - 키와 값의 쌍으로 이루어진 컬렉션
//Set - 순서가 없고, 멤버가 유일한 컬렉션

//Array
var integers: Array<Int> = Array<Int>()
integers.append(1) //1추가
integers.append(100) //[1, 100]

integers.contains(100) //100을 가지고 있는가? true

integers.remove(at: 0) //0번째의 멤버를 삭제
integers.removeLast() //마지막에 있는 멤버를 삭제
integers.removeAll() //전부다 삭제

integers.count //어레이 안에 있는 요소의 수

//Array<Double> = [Double]
var doubles: Array<Double> = [Double]()

var strings: [String] = [String]()

var characters: [Character] = []

//let으로 선언하면 불변 어레이 .. append, remove 사용불가
let immutableArray = [1,2,3]


//Dictionary <키, 값>
var anyDictionary: Dictionary<String, Any> = [String:Any]()

//키에 해당하는 값 할당
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 123

anyDictionary["someKey"] = "dictionary" //키에 해당하는 값을 바꿀수도있다

anyDictionary.removeValue(forKey: "anotherKey")
//anotherKey에 해당하는 값을 삭제

anyDictionary["someKey"] = nil
//someKey에 해당하는 값을 없앨때. removeValue와 같은 기능
anyDictionary //[:]


//let으로 선언해주었기 때문에 나중에 변경할 수 없다.
let emptyDixtionary: [String:String] = [:] //빈 딕셔너리 생성
let initializedDictionary: [String:String] = ["name":"Park","gender":"male"]

//let someValue: String = initializedDictionary["name"]
//이 키에 해당하는 값이 있을수도 없을 수도 있기 때문에 이렇게 하면 오류(불확실성)

//Set
var integerSet: Set<Int> = Set<Int>()
integerSet.insert(1) //inserted true, memberAfterInsert 1
integerSet.insert(100) //inserted true, memberAfterInsert 100
integerSet.insert(99) //inserted true, memberAfterInsert 99
integerSet.insert(99) //inserted false, memberAfterInsert 99
integerSet.insert(99) //inserted false, memberAfterInsert 99
//set은 안에 중복된 값이 없는걸 보장

integerSet.contains(100) //100이 있는지 확인 true

integerSet.remove(100) //100을 삭제
integerSet.removeFirst() //99삭제

integerSet.count //갯수

let setA: Set<Int> = [1,2,3,4,5]
let setB: Set<Int> = [3,4,5,6,7]

let union: Set<Int> = setA.union(setB) //합집합 구해진다.

let sortedUnion: [Int] = union.sorted()

let intersection: Set<Int> = setA.intersection(setB)
//교집합이 구해진다.

let subtractiong: Set<Int> = setA.subtracting(setB)
//차집합이 구해진다. 

