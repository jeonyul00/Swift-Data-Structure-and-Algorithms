import UIKit

/*
    스위프트의 표준 라이브러리를 살펴보자.
 */

/*
    struct: 구조체
    자동으로 생성되는 초기화 함수 외에 커스텀 초기화 함수 사용가능
    메소드를 지닐 수 있음
    프로토콜을 구현할 수 있음
 
    언제 구조체를 쓰는가?
    1. 특정 타입의 생성 목적이 간단한 몇 개의 값을 캡슐화하려는 것인 경우
    2. 캽슐화한 값을 구조체의 인스턴스에 전달하거나 할당할 때 참조가 아닌 복사를 할 경우
    3. 구조체에 의해 저장되는 프로퍼티를 참조가 아닌 복사를 위한 밸류 타입인 경우
    4. 기존의 타입에서 가져온 프로퍼티나 각종 기능을 상속할 필요가 없는 경우
 */

/*
    array
    동일 타입의 값을 저장하는 데이터 타입
    반드시 동일 타입의 값만 저장해야 한다.
    스위프트에서 배열은 제네릭 컬렉션이다. -> 어떤 타입이든 될 수 있다. (클래스도 넣을 수 있다.)
    스위프트에서 배열은 클래스가 아닌 구조체로 정의된다.
 
    배열을 생성하면 해당 배열 요소를 저장하기 위한 추가 저장 공간이 할당된다.
    이는 배열에 메모리 공간을 재할당하지 않고 배열 관련 작업을 처리할 수 있을 정도의 잠재적인 저장 공간이라 할 수 있다.
    배열에 요소가 추가될 때마다 소진된 배열 용량을 자동으로 증가시킨다.
    만약, 배열에 요소가 반복적으로 추가될 것임을 알 수 있는 경우, 추가적인 배열 용량을 미리 할당해두는 편이 좋다.
 */
var intArr:[Int] = []
intArr.capacity // 0
intArr.reserveCapacity(500) // 용량 예약
intArr.capacity // 508
intArr.append(1)
intArr.insert(2, at: intArr.startIndex)
var total:Int = 0
for i in intArr {
    total += i
}
total

/*
    딕셔너리
    동일한 데이터 타입이 키와 값 쌍으로 묶여 있는 무순위 컬렉션, 순서를 지정할 수 없다.
 */
var myDict = Dictionary<Int,String>()
var myDict2 = [Int:String]()
myDict.updateValue("first value", forKey: 0)
myDict[0] = "update first value"
myDict.removeValue(forKey: 0)
for (i,v) in myDict {
    
}

/*
    세트
    중복되지 않고 유니크, 닐이 포함되지 않은 non-nil 순위를 정의할 수 없는 무순위 컬렉션, 형식 상 hasgable 프로토콜에 부합해야함 -> 스위프트의 모든 기본 타입은 기본적으로 hashable 프로토콜을 따리도록 설계되어있다.
 */
var mySet = Set<String>()
mySet = ["1","1","2","3"]
mySet
mySet.insert("4")
mySet.contains("4") // true

// 집합 개념을 기반으로 만든 타입으로 다양한 메소드가 있다.
var mySet2 = ["1","2","3","4","5"]
mySet.union(mySet2) // 합집합
mySet.intersection(mySet2) // 교집합
mySet.subtract(mySet2) // 차집합
// 기타 등등

mySet.isSubset(of: mySet2) // true
mySet.isSuperset(of: mySet2) // false

/*
    튜플
    컬렉션 타입은 아니지만, 컬렉션과 매우 비슷한 특징을 지닌다. 튜플 하나에는 하나 이상의 데이터 타입을 함께 담을 수 있으며, 모두 같은 타입일 필요x
    컬렉션 타입이 아니기 때문에 SequenceType 프로토콜에 부합할 필요x, 내부 요소 순회 불가
 
    무기명 튜플
    기명 튜플
 */

let responseCode = (400, "invalid error", false)
let (code, msg, success) = responseCode
code

let responseCode2 = (code:200, msg:"ok", success:true)
responseCode2.code

/*
    서브 스크립팅
    하나 혹은 그 이상의 입력 파라미터를 받을 수 있으며, 이때의 파라미터는 서로 다른 타입이어도 무방하다. 반환값 역시 어떤 타입이든 가능하다.
    서브스크립트 정의에는 subscript 키워드를 사용하며, 읽기전용 속성으로 정의하거나 특정 요소에 접근하기 위한 getter setter를 설정할 수 있다.
 */

class MovieList {
    private var tracks = ["war", "the king", "300"]
    
    subscript (index:Int) -> String {
        get {
            return self.tracks[index]
        }
        set {
            self.tracks[index] = newValue
        }
    }
}

/*
    스위프트와 오브젝티브C 상호 관련성
    스위프트와 오브젝티브C는 서로 호환되도록 만들어졌다. 단, 전부는 아님 => 오브젝티브C에 있는 상당수의 기능과 함수가 스위프트와 호환되지 않고 있다.
    (RN에서 프로그래밍 하다보면 결국 Android와 iOS 부분을 건드는것 처럼 결국 오브젝티브C를 건들게 되어있다.)

    오브젝티브C의 초기화 방식
    임포트: import Foundation -> 파운데이션 프레임워크에 속한 모든 오브젝티브C 클래스 임포트
 
    스위프트: 메소드 === 오브젝티브C: 메시지
    오브젝티브C의 명령 체계인 메시지는 리시버, 셀렉터, 파라미터 등의 요소로 구성되어 있다.
    NSObject 또는 @objc
 */

// NSObject를 상속받아 오브젝티브C 사용
var postalCode:NSString = NSString(format: "%d-%d", 32259,1234)
var len = postalCode.length

// @objc를 사용하여 오버로딩
@objc(MovieList)
class MovieList2: NSObject {}

/*
    스위프트의 타입 호환성
    init을 정의할 때 실패 가능 초기화 기능을 추가함 -> if let, guard let
 */

/*
    구조체롸 클래스를 개발하고자 한다면, SOLID 원칙을 준수해야 한다.
    - 단일 책임 원칙: 하나의 클랫스는 오직 하나의 책임만 부담해야 한다.
    - 개방과 폐쇄의 원칙: 소프트웨어는 확장이라는 측면에서는 개방돼 있어야 하고, 수정이라는 측면에서는 폐쇄돼 있어야한다.
    - 리스코프 대체 원칙: 특정 클래스에서 분화돼 나온 클래스는 원본 클래스로 대체 가능해야 한다.
    - 인터페이스 세분화 원칙: 개별적인 목적에 대응할 수 있는 여러개의 인터페이스가 일반적인 목적에 대응할 수 있는 하나의 인터페이스가 낫다.
    - 의존성 도치의 원칙: 구체화가 아닌 추상화를 중시한다.
 */

/*
    컬렉션 클래스 브릿징
    스위프트는 파운데이션 컬렉션 타입인 NSArray, NSSet, NSDictionary를 스위프트 배열, 세트, 딕셔너리 타입으로 브릿징 할 수 있도록 지원한다.
    이 기능을 이용하면, 컬렉션을 활용하는 다수의 네이티브 스위프트 알고리즘에서 파운데이션 컬렉션 타입과 스위프트 컬렉션 타입을 서로 교환해서 사용할 수 있게 된다.
 */

// NSArray -> Array
let nsArr1: NSArray = [0,"0", true] // 오브젝티브C까지는 모든 타입을 한 번에 넣을 수 있었음
let nsArr2: NSArray = [0,0, 1]
let nsArr3: [Int] = nsArr2 as! [Int] // 아 이렇게도 되네 강제 언래핑
if let nsArr4: [Int] = nsArr2 as? [Int] {
    nsArr4.count
}

// NSSet -> Set
/*
    파라미터화된 타입으로 NSSet을 브릿징하면 Set<ObjectType>의 세트가 만들어진다.
    별도의 파라미터 타입을 지정하지 않고 브릿징하면 Set<AnyObject>타입의 세트가 만들어진다.
 
    NSSet을 특정 타입으로 브릿징할 때
    만약 NSSet에 들어있는 요소의 타입이 명확하게 지정되어 있다면, Swift에서는 해당 타입의 Set으로 변환된다. 예를 들어, NSSet<NSString>을 Set으로 브릿징하면 Set<String>이 된다.

    타입을 명확하게 지정하지 않고 브릿징할 때
    만약 NSSet의 요소 타입이 명확하게 지정되지 않았다면, Swift에서는 기본적으로 Set<AnyObject> 타입으로 브릿징한다. 이는 해당 세트에 들어갈 수 있는 타입이 AnyObject로 제한된다는 의미이다. AnyObject는 모든 클래스 타입을 나타내므로, 다양한 객체를 포함할 수 있다.
 */

// NSDictionary -> Dictionary
/*
    파라미터화된 타입으로 NSDictionary를 브릿징하면 [ObjectType] 타입의 딕셔너리가 만들어지고, 별도의 파라미터 타입을 지정하지 않고 브릿징하면 [NSObject: AnyObject] 딕셔너리가 만들어진다.
 */
