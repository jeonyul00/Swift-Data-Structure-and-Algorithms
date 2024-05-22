import UIKit

/*
스위프트는 강력한 언어임이 틀림없지만, 아무리 강력한 언어라 하더라도 그에 걸맞는 강력한 표준 라이브러리가 없다면 무용지물입니다. 스위프트의 표준 라이브러리는 데이터 타입, 컬렉션 타입, 함수와 메소드, 그리고 다양한 목적에 부합하는 다수의 프로토콜 등 애플리케이션 개발을 위한 각종 구현 요소를 제공합니다. 이번 장에서는 스위프트의 표준 라이브러리를 심도있게 살펴볼 것입니다. 특히, 배열, 딕셔너리, 세트, 튜플 등 컬렉션 타입을 매우 상세하게 소개합니다.
*/

/*
### struct와 class
스위프트에서는 성능 최적화, 안전성 강화, 스레드 안전성, 간결한 설계를 위해 주로 값 타입인 구조체를 사용합니다. 그러나 특정 상황에서는 클래스가 더 적합할 수 있습니다. 예를 들어, 복사가 아닌 참조를 통해 데이터를 공유해야 하는 경우, 또는 상속이 필요한 경우 클래스가 사용됩니다.
*/

struct ExampleStruct {
    var value = "Example"
}

class ExampleClass {
    var value = "Example"
}

let exampleStruct = ExampleStruct()
let exampleClass = ExampleClass()

// exampleStruct.value = "New Value" // 불가능
exampleClass.value = "New Value" // 가능

/*
### 스위프트의 배열
스위프트의 배열은 Array, ContiguousArray, ArraySlice 세 가지 유형이 있습니다. 배열은 값 타입으로, 메모리 효율성이 높습니다. 요소가 클래스나 @objc 타입인 경우 참조가 저장되며, 그렇지 않은 경우 실제 데이터가 인접 메모리 블록에 저장됩니다.
*/

var intArray = [Int]()
intArray.reserveCapacity(500)

/*
### 딕셔너리
딕셔너리는 키-값 쌍으로 이루어진 무순위 컬렉션입니다. 키와 값은 동일한 타입을 가져야 하며, 키는 유일해야 합니다. 딕셔너리는 키를 통해 값을 효율적으로 조회, 추가, 업데이트할 수 있습니다.
*/

var myDictionary: [String: Int] = ["one": 1, "two": 2]
myDictionary["three"] = 3
myDictionary.updateValue(4, forKey: "four")
myDictionary.removeValue(forKey: "one")

/*
### 세트
세트는 중복되지 않고 순서가 없는 유일한 값들의 컬렉션입니다. 세트는 Hashable 프로토콜을 준수하는 타입만 저장할 수 있습니다. 세트는 배열보다 데이터 접근 속도가 빠릅니다.
*/

var mySet: Set<Int> = [1, 2, 3]
mySet.insert(4)
mySet.remove(2)

/*
### 튜플
튜플은 하나 이상의 데이터를 함께 묶어주는 컬렉션 타입입니다. 서로 다른 타입의 요소를 가질 수 있으며, 순회는 불가능합니다.
*/

let myTuple = (1, "Swift", true)
let (number, language, isAwesome) = myTuple

/*
### 서브스크립트
서브스크립트는 컬렉션 타입의 요소에 접근하기 위한 특별한 방법입니다. 클래스, 구조체, 열거형에서 서브스크립트를 정의하여 배열처럼 인덱스를 통해 값을 가져오거나 설정할 수 있습니다.
*/

class MovieList {
    private var tracks = ["war", "dark knight", "hello"]
    
    subscript(index: Int) -> String {
        get {
            return tracks[index]
        }
        set(newValue) {
            tracks[index] = newValue
        }
    }
}

let myMovieList = MovieList()
print(myMovieList[1]) // "dark knight"
myMovieList[1] = "inception"
print(myMovieList[1]) // "inception"

/*
### 디스패치 기법
스위프트는 정적 디스패치와 동적 디스패치를 지원합니다. 정적 디스패치는 컴파일 시점에 메소드를 결정하여 빠른 성능을 제공하며, 동적 디스패치는 런타임에 메소드를 결정하여 유연성을 제공합니다. @objc 키워드를 사용하면 동적 디스패치가 강제됩니다.
*/

import Foundation

class DispatchExample {
    func staticMethod() {
        print("Static Dispatch")
    }
    
    @objc dynamic func dynamicMethod() {
        print("Dynamic Dispatch")
    }
}

let instance = DispatchExample()
instance.staticMethod()  // 정적 디스패치
instance.dynamicMethod() // 동적 디스패치

/*
### 스위프트와 오브젝티브C의 호환성
스위프트는 오브젝티브C와의 호환성을 유지하기 위해 다양한 기능을 제공합니다. 스위프트는 @objc 속성을 통해 오브젝티브C 코드와 상호작용할 수 있습니다. 이는 오브젝티브C의 동적 디스패치 방식을 사용하게 하며, 런타임에 메소드를 동적으로 호출할 수 있게 합니다.
*/

@objc class ObjectiveCClass: NSObject {
    @objc func exampleMethod() {
        print("Objective-C Method")
    }
}

let objCInstance = ObjectiveCClass()
objCInstance.exampleMethod()

/*
### 실패 가능 초기화
스위프트는 초기화 중 실패할 가능성을 처리하기 위해 실패 가능 초기화(init?)를 제공합니다. 이는 초기화가 실패할 수 있는 상황에서 유용합니다.
*/

struct FailableInitStruct {
    var value: String
    
    init?(value: String) {
        if value.isEmpty {
            return nil
        }
        self.value = value
    }
}

if let instance = FailableInitStruct(value: "Hello") {
    print(instance.value) // "Hello"
} else {
    print("Initialization failed")
}

/*
### 컬렉션 클래스 브릿징
스위프트는 NSArray, NSDictionary, NSSet 등의 오브젝티브C 컬렉션 클래스와 자동으로 브릿징됩니다. 이를 통해 스위프트와 오브젝티브C 코드 간의 원활한 데이터 전송이 가능합니다.
*/

let swiftArray: [String] = ["one", "two", "three"]
let nsArray: NSArray = swiftArray as NSArray
print(nsArray) // ("one", "two", "three")

/*
### 프로토콜 작성 문법
프로토콜은 메소드, 프로퍼티, 연관 타입 등을 선언하는 청사진 역할을 합니다. 프로토콜을 통해 공통의 인터페이스를 정의하고, 이를 채택하는 타입에서 해당 인터페이스를 구현할 수 있습니다.
*/

protocol ExampleProtocol {
    var description: String { get }
    func doSomething()
}

extension ExampleProtocol {
    func doSomething() {
        print("Doing something")
    }
}

struct ExampleStruct: ExampleProtocol {
    var description: String {
        return "Example Struct"
    }
}

let example = ExampleStruct()
example.doSomething() // "Doing something"

/*
### 타입으로서의 프로토콜
프로토콜은 타입으로도 사용할 수 있습니다. 이를 통해 특정 프로토콜을 준수하는 객체를 타입으로 받아들이는 함수나 메소드를 정의할 수 있습니다.
*/

protocol AnotherExampleProtocol {
    func exampleMethod()
}

struct AnotherStruct: AnotherExampleProtocol {
    func exampleMethod() {
        print("Example Method")
    }
}

func takeProtocolType(param: AnotherExampleProtocol) {
    param.exampleMethod()
}

let anotherExample = AnotherStruct()
takeProtocolType(param: anotherExample) // "Example Method"

/*
### 프로토콜 익스텐션
프로토콜 익스텐션을 통해 프로토콜에 기본 구현을 제공할 수 있습니다. 이를 통해 프로토콜을 채택한 모든 타입에 공통 기능을 제공할 수 있습니다.
*/

protocol DefaultMethodProtocol {
    func requiredMethod()
}

extension DefaultMethodProtocol {
    func requiredMethod() {
        print("Default Implementation")
    }
}

struct DefaultImplementationStruct: DefaultMethodProtocol {}
let defaultImpl = DefaultImplementationStruct()
defaultImpl.requiredMethod() // "Default Implementation"

/*
### 열거형 배열 만들기
열거형은 관련된 값들을 묶어서 사용하기 위한 타입입니다. 배열과 결합하여 다양한 형태로 활용할 수 있습니다.
*/

enum Direction {
    case north, south, east, west
}

var directions: [Direction] = [.north, .south, .east, .west]
directions.append(.north)
