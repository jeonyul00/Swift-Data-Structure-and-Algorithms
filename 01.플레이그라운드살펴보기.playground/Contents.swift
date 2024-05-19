import UIKit

/*
    swift: 애플의 주요 운영체제인 macOS, iOS, watchOS, tvOS를 위해 새롭게 만들어진 강력한 프로그래밍 언어.
    이 장에서는 데이터 구조와 알고리즘이 무엇인지에 대해 설명한다. 그리고 그것이 왜 중요한지에 대해 설명한다.
    
    데이터 구조의 중요성: 데이터 구조는 프로그래밍에 있어 효율적이며, 확장 가능하고 유지 보수성 높은 시스템을 만들기 위한 주요 요소 중 하나로서, 시스템에서 데이터의 공유, 유지, 정렬, 검색 등 데이터 활용을 휘한 데이터의 체계화 방법이다.
    데이터 구조 + 알고리즘 = 프로그램
    데이터 구조 + 알고리즘 = 문재를 해결하기 위한 패턴
    데이터의 추상화: 데이터가 지닌 복잡성을 관리하기 위한 기술이다. 구조를 디자인할 때 데이터 추상화 기법을 사용하는데 이는 개발자가 애플리케이션을 만들려고 할 때 내부의 상세한 구현 방식을 몰라도 되도록 하기 위함이다. => 내부의 복잡한 구현 방식을 드러내지 않음으로써 개발자는 알고리즘이 제공하는 인터페이스의 활용에 더욱 집중할 수 있으며, 이 때문에 데이터 구조는 프로그램 내부에서 구현하게 된다.
 */

// 명령어의 실행 결과는 자동적을 포맷되어 각자의 타입으로 표시된다. 변수와 상수 역시 해당 타입이 적용된다.
var firstName = "Kyra" // String
print("Hello \(firstName)")
let lastName: String = "Smith"
Int("2000") // 2000

/*
    데이터 구조의 가장 근원적인 형태는 사싱 상 배열과 포인터 두 가지 타입이다. 다른 데이터 구조는 여기서 파생된다고 할 수 있다.
    인접 데이터 구조: 이름에서 알 수 있듯이 데이터를 메모리 영역 중 인접한 부분에 저장한다. -> 인접 데이터 구조에는 배열, 힙, 매트릭스, 해시 테이블 등이 있다.
    연결 데이터 구조: 서로 명확히 구분되는 메모리 영역을 차지하되, 포인터라는 주소 체계로 연결, 관리되는 구조다. -> 연결 데이터 구조에는 목록, 트리, 그래프 등이 있다.
 */

/*
    인접 데이터 구조: 인접 데이터 구조는 선형 데이터 구조를 이루며 일정한 순서에 따라 개별 데이터 요소에 접근할 수 있는 인덱스 기반의 데이터 구조이다.
        
        배열: 데이터 구조 가운데 가장 널리 사용되고 있으며, 대부분의 프로그래밍 언어에서 기본적으로 제공하는 데이터 구조이기도 하다. 가장 단순한 유형은 일차원 배열(선형 배열)이다. -> 데이터 간에 순서가 있으며, 임의로 특정 요소에 접근할 수 있는 데이터 집합의 성질을 지닌다.
            또다른 배열의 형식으로는 다차원 배열이 있으며, 행렬은 다 차원 배열의 대표적인 형식이다. 행렬은 이차원 배열을 구현한 것이다.
            swift에서 배열을 선언하는 분법은 세 가지이다.
 */
var myIntArr1: Array<Int> = [1,3,5,7,9] // 기본
var myIntArr2: [Int] = [1,3,5,7,9] // 축약형
var myIntArr3 = [1,3,5,7,9] // 추측형 -> 컴파일러가 컴파일을 실행할 때 제공한 단서를 기준으로 타입을 추측하는 기능이다.
// 빈 배열 선언
var myIntArr4: [Int] = []
// 다중 배열
var my2DArr:[[Int]] = [[1,2],[2,3],[3,4]]
print(my2DArr[0]) // [1,2]
print(my2DArr[0][1]) // 2

/*
    배열 요소 가져오기
    배열의 요소를 가져오는 방법에는 여러가지가 있다. 해당 요소의 인덱스 번호를 안다면, 직접 해당 번호로 호출해도 된다.
    때론, 순환문을 이용해서 배열 내 특정 요소를 반복적으로 가져와야 할 때도 있는데, 이 때 for..in 문법을 사용한다.
    또, 배열 내 일정 역역에 속한 요소를 가져와야 할 때도 있으며, 이 때는 일련의 인덱스 번호를 보두 입력하기보다는 범위를 지정해서 가져오는 것이 일반적이다.
 */

// 인덱스 번호를 통해 요소를 직접 가져오는 방법
myIntArr1[0]

// 배열 내 요소를 반복적으로 가져오는 방법
for element in myIntArr1 {
    print(element)
}

// 배열 요소 중 일정 범위에 속한 배열 요소를 가져올 때는 다음과 같이 한다.
myIntArr1[1...4]

/*
    배열 요소 추가
    요소를 추가하는 방법은 해당 요소를 추가하려는 위치가 배열의 맨 끝 부분인지, 배열 내 처음과 끝 사이인지에 따라 달라진다.
 
    요소 삭제
    삭제 역시 삭제하려는 요소의 위치가 배열의 맨 끝 부분인지, 배열 내 처음과 끝 사이인지에 따라 달라진다.
 */

// 맨 끝에 추가
myIntArr1.append(10)

// 특정 위치에 추가
myIntArr1.insert(10, at: 1) // 1번 인덱스에 값 10 추가

// 맨 끝 요소 삭제
myIntArr1.removeLast()

// 특정 인덱스 위치의 요소 삭제
myIntArr1.remove(at: 1)

/*
    연결 데이터구조: 데이터 타입과 이를 다른 데이터와 뮦어주는 포인터로 구성된다. 여기서 포인터란 메모리상의 위치주소를 의미한다.
    C와 같은 로우 레벨 프로그래밍 언어와 달리 스위프트는 직접적으로 포인터에 접근하지 않고 포인터를 활용할 수 있는 별도의 추상 체계를 제공한다.

        연결 리스트(linked lists): 일련의 노드로 구성되며, 이들 노드는 링크 필드를 통해 서로 연결되어 있다. 가장 간단한 형태의 연결 리스트는 데이터와 다음 노드에 연결할 수 있는 레퍼런스(또는 링크) 정보를 포함한다. 좀 더 복잡한 형태의 경우, 추가 링크 정보를 통해 연결된 데이터에서 앞 또는 뒤로 이동할 수 있다.
            연결 리스트는 자체 참조 클래스인 노드로 구성되고, 각각의 노드는 데이터와 전체 연결 데이터에서 다음 노드로 이동 할 수 있는 링크 정보를 포함한다.
                노드(Node):
                연결 리스트는 여러 개의 노드로 구성됩니다.
                각 노드는 두 가지 주요 요소를 가지고 있습니다:
                데이터: 노드가 저장하고 있는 실제 값입니다.
                링크: 다음 노드를 가리키는 참조(포인터)입니다.
            "자체 참조 클래스"라는 것은 클래스의 인스턴스가 동일한 클래스의 다른 인스턴스를 참조할 수 있다는 의미입니다. -> 예를 들어, Node 클래스가 있다면, 각 Node 객체는 다른 Node 객체를 참조할 수 있습니다.
        첫 번째 노드는 헤드(Head)라고 불립니다. 각 노드는 다음 노드를 가리키는 링크를 가지고 있으며, 마지막 노드는 nil 또는 None을 가리켜 리스트의 끝을 나타냅니다.
 */

// 단일 연결 리스트 -> 추 후 상세히 다룰 예정
class LinkedList<T> {
    var item: T?
    var next: LinkedList<T>?
}

/*
    데이터 구조의 장단점
 
    장점
        배열: 인덱스 값을 미리 알고 있는 경우, 해당 데이터에 매우 신속하게 접근할 수 있고, 새로운 요소를 매우 신속하게 삽입할 수 있다.
        정렬된 배열: 비정렬 배열에 비해 검색 속도가 더 빠르다.
        큐: 먼전 입력된 데이터가 먼저 출력될 수 있는 FIFO 방식이 제공됨
        스택: 나중에 입력된 데이터가 먼저 출력될 수 있는 LIFO 접근 방식이 제공됨
        리스트: 데이터 삽입 및 삭제 속도가 빠르다.
        해시 테이블: 키값을 미리 알고 있는 경우, 해당 데이터에 매우 신속하게 접근할 수 있고, 새로운 요고를 매우 신속하게 삽입할 수 있다.
        힙: 매우 신속하게 삽입 및 삭제가 가능하고 최대 혹은 최소 항목에 대한 접근 속도가 빠르다.
 
    단점
        배열: 크기가 고정되고, 삭제 및 검색은 느리게 진행된다.
        정렬된 배열: 크기가 고정되고, 삭제 및 검색은 느리게 진행된다.
        큐: 다른 요소에 대한 접근 속도는 느리다.
        스택: 다른 요소에 대한 접근 속도는 느리다.
        리스트: 검색 속도는 느리다.
        해시 테이블: 키값을 모를 경우 접근 속도가 느리고, 삭제 속도가 느리며 메모리 효율성이 떨어진다.
        힙: 다른 요소에 대한 접근 속도가 느리다
 
    알고리즘을 작성하려면? 시간과 공간이 필요한데 이 두가지야 말로 알고리즘의 가장 중요한 자원이다.
 */

/*
    스위프트에서의 데이터 타입
    value type: 오직 하나의 소유 객체만을 지니며, 해당 타입의 데이터가 변수 또는 상수에 할당되었을 때 혹은 함수에 전달되었을 때, 지니고 있던 값을 복사한다. value type에는 다시 열거형과 구조체 유형이 있으며 스위프트의 모든 데이터 타입은 기본적으로 구조체이다.
    reference type: 값을 복사하지 않고 공유한다. 즉, reference type은 변수에 할당하거나 함수에 전달할 때 값을 복사해서 제공하는 대신, 동일한 인스턴스를 참조값으로 활용한다.
 
    ❗️ 여기서 주의할 것은 이들 데이터 타입은 다른 언어에서와 같은 원천 데이터 타입은 아니라는 것이다. -> 이들 데이터 타입은 스위프트 표준 라이브러리에서 구조체 타입으로 정의되고 구현된 기명 타입이다.
        원시 데이터 타입(Primitive Data Types):
        C나 Java 같은 언어에서 기본 데이터 타입(int, float, double, char 등)은 주로 원시 데이터 타입이라고 불리며, 언어의 기본 빌딩 블록입니다. 이들은 언어 차원에서 특별한 취급을 받습니다.
 
        스위프트의 기명 타입(Named Types):
        스위프트에서는 Int, Double, String 등과 같은 데이터 타입이 단순한 원시 데이터 타입이 아닙니다.
        이들 타입은 스위프트 표준 라이브러리에서 구조체로 정의되어 있습니다.
        구조체는 스위프트의 사용자 정의 타입 중 하나로, 속성(properties)과 메서드(methods)를 가질 수 있습니다.
 
 p.47
 
 */

