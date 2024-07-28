import UIKit

/*
    기본적인 데이터 구조
    데이터 구조의 가장 근원적인 형태는 배열(인접 데이터구조)과 포인터(연결 데이터구조)다.
    인접 데이터구조: 데이터를 메모리 영역 중 인접한 부분에 저장한다. 배열, 힙, 매트릭스, 해시 테이블 등 선형 데이터 구조를 이룬다.
    연결 데이터구조: 서로 명확히 구분되는 메모리 영역을 차지하되, 포인터라는 주소 체계로 연결, 관리된다. 리스트, 트리, 그래프 등

    연결 데이터구조: 데이터 타입과 이를 다른 데이터와 묶어주는 포인터로 구성된다. 여기서 포인터란, 메모리상의 위치 주소를 의미한다. => 데이터와 링크로 구성되어 있다. 자체 참조하여 동일한 클래스의 다른 인스턴스를 참조할 수 있다.
 */

class LinkedList<T> {
    var item: T?
    var next: LinkedList<T>?
}

/*
    밸류 타입과 레퍼런스 타입

    밸류 타입: 오직 하나의 소유 객체만을 지니며, 해당 타입의 데이터가 변수 또는 상수에 할당 됐을 때 혹은 함수에 전달됐을 때, 지니고 있던 값을 복사한다. struct와 enum 두가지 유형이 있으며 스위프트의 모든 데이터 타입은 기본적으로 구조체(struct)이다.
    레퍼런스 타입: 값을 복사하지 않고 공유한다. 즉 레퍼런스 타입은 변수에 할당하거나 함수에 전달할 때 값을 복사해서 제공하는 대신, 동일한 인스턴스를 참조값을 활용한다. 레퍼런스 타입은 여러 개의 소유 객체가 참조라는 방식으로 공유할 수 있다.
 
    여기서 중요한 점은 이들 데이터 타입(int, double, string character etc)은 다른 언어에서와 같은 원천 데이터 타입이 아니다!
    이들은 스위프트 표준 라이브러리에서 구조체 타입으로 정의되고 구현된 기명타입이다!
 */

struct ValueStruct {
    var typeValue: Int = 1
}

var copyStruct = ValueStruct()
var copyStruct2 = copyStruct


copyStruct.typeValue = 2
copyStruct2.typeValue // 1
copyStruct.typeValue // 2

class RefrClass {
    var typeRef: Int = 1
}

var copyRef = RefrClass()
var copyRef2 = copyRef

copyRef.typeRef = 2
copyRef2.typeRef // 2
copyRef.typeRef // 2

/*
    기명 타입과 복합 타입
    
    기명 타입: 사용자가 정의할 수 있는 데이터 타입, 해 당 타입이 정의 될 때 특정한 이름을 부여할 수 있는 타입 클래스 구조체 열거형 프로토 타입도 있고 이 외에 스위프트 라이브러리에는 배열, 딕셔너리, 셋, 옵셔널 값을 나타낼 수 있는 기명 타입이 별도로 마련되어 있다. -> 기명 타입은 익스텐션 선언을 통해 동작 범위를 확장 할 수 있다.
    복합 타입: 별도의 이름이 붙여지지 않은 타입, function, type 등 두개의 복합 타입이 정의돼 있다. 복합 타입은 기명 타입은 물론 또 다른 복합 타입을 포함 할 수 있다. ex) (Int, (Bool, String))
 */


/*
    type alias: 어떤 작업을 진행 중일 때, 특정 "타입"의 이름을 좀 더 해당 작업 또는 임무의 맥락 또는 분위기가 반영된 새로운 이름으로 부르고 싶을 때 사용
 */

typealias ageType = Int
typealias nameType = String

let human:(nameType, ageType) = ("jeonyul", 30)

