import UIKit

/*
 Swift: 애플의 macOS, iOS, watchOS, tvOS를 위해 만들어진 강력한 프로그래밍 언어입니다.
 이 장에서는 데이터 구조와 알고리즘의 중요성에 대해 설명합니다.
 
 데이터 구조의 중요성:
 - 효율적이고 유지 보수성 높은 시스템을 만들기 위한 주요 요소입니다.
 - 데이터의 공유, 유지, 정렬, 검색 등을 체계화하는 방법입니다.
 - 데이터 구조 + 알고리즘 = 프로그램
 - 데이터 추상화: 내부의 복잡한 구현 방식을 숨기고, 인터페이스에 집중할 수 있게 합니다.
*/

// 변수와 상수의 타입이 자동으로 지정됩니다.
var firstName = "Kyra" // String
print("Hello \(firstName)")
let lastName: String = "Smith"
print(Int("2000") ?? 0) // 2000

/*
 데이터 구조의 기본 형태는 배열과 포인터입니다.
 - 인접 데이터 구조: 배열, 힙, 매트릭스, 해시 테이블 등
 - 연결 데이터 구조: 목록, 트리, 그래프 등
*/

/*
 인접 데이터 구조는 선형 데이터 구조를 이루며, 인덱스를 기반으로 개별 데이터 요소에 접근할 수 있습니다.
 배열: 데이터 간에 순서가 있으며, 임의로 특정 요소에 접근할 수 있는 데이터 집합입니다.
*/

// 배열 선언 방법
var myIntArr1: Array<Int> = [1, 3, 5, 7, 9] // 기본
var myIntArr2: [Int] = [1, 3, 5, 7, 9] // 축약형
var myIntArr3 = [1, 3, 5, 7, 9] // 타입 추론
var myIntArr4: [Int] = [] // 빈 배열
var my2DArr: [[Int]] = [[1, 2], [2, 3], [3, 4]] // 2차원 배열

// 배열 요소 접근
print(my2DArr[0]) // [1, 2]
print(my2DArr[0][1]) // 2

// 배열 요소 접근 및 반복
print(myIntArr1[0]) // 인덱스로 접근
for element in myIntArr1 {
    print(element) // 반복문으로 접근
}
print(myIntArr1[1...4]) // 범위로 접근

// 배열 요소 추가 및 삭제
myIntArr1.append(10) // 맨 끝에 추가
myIntArr1.insert(10, at: 1) // 특정 위치에 추가
myIntArr1.removeLast() // 맨 끝 요소 삭제
myIntArr1.remove(at: 1) // 특정 인덱스 요소 삭제

/*
 연결 데이터 구조: 포인터를 통해 메모리상의 위치를 연결하는 구조입니다.
 - 연결 리스트: 일련의 노드로 구성되며, 각 노드는 데이터와 다음 노드를 가리키는 링크를 포함합니다.
*/

// 단일 연결 리스트 예시
class LinkedList<T> {
    var item: T?
    var next: LinkedList<T>?
}

/*
 데이터 구조의 장단점
 - 배열: 빠른 접근과 삽입이 가능하지만, 크기가 고정됨
 - 정렬된 배열: 비정렬 배열에 비해 검색 속도가 빠름
 - 큐: FIFO 방식 제공
 - 스택: LIFO 방식 제공
 - 리스트: 빠른 삽입과 삭제
 - 해시 테이블: 빠른 접근과 삽입, 키값을 모를 경우 비효율적
 - 힙: 빠른 삽입과 삭제, 최대/최소 항목 접근이 빠름
*/

/*
 스위프트의 데이터 타입
 - Value Type: 값이 복사되는 타입 (열거형, 구조체)
 - Reference Type: 참조가 복사되는 타입 (클래스)
 - 타입 에일리어스: 기존 타입을 다른 이름으로 정의
*/
typealias TCPPacker = UInt8

/*
 표준 라이브러리의 컬렉션: 배열, 딕셔너리, 셋
*/

/*
 기명 타입 (Named Type):
 기명 타입은 특정 이름을 가진 타입입니다. 클래스, 구조체, 열거형을 정의하여 만듭니다.
 예시:
 */
struct Point {
    var x: Int
    var y: Int
}

class Person {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

enum Direction {
    case north
    case south
    case east
    case west
}

/*
 복합 타입 (Compound Type):
 복합 타입은 여러 타입을 조합하여 만든 타입입니다. 함수 타입과 튜플 타입이 있습니다.
 예시:
 */

// 함수 타입
let add: (Int, Int) -> Int = { (a, b) in
    return a + b
}
print(add(3, 5)) // 8

// 튜플 타입
let coordinates: (Int, Int) = (10, 20)
print(coordinates)

/*
 삽입 정렬 함수:
 inout: 매개변수를 함수 내에서 수정 가능하게 함
*/
func insertionSort(alist: inout [Int]) {
    for i in 1..<alist.count {
        let temp = alist[i]
        var j = i - 1
        while j >= 0 && alist[j] > temp {
            alist[j + 1] = alist[j]
            j -= 1
        }
        alist[j + 1] = temp
    }
}

// 사용 예시
var numbers = [3, 1, 4, 1, 5, 9, 2, 6]
insertionSort(alist: &numbers)
print(numbers) // 정렬된 배열 출력
