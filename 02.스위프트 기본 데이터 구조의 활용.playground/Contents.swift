import UIKit

/*
 스위프트는 강력한 언어임이 틀림없지만, 아무리 강력한 언어라 하더라도 그에 걸맞는 강력한 표준 라이브러리가 없다면 무용지물이다.
 스위프트의 표준 라이브러리는 데이터 타입, 컬렉션 타입, 함수와 메소드, 그리고 다양한 목적에 부합하는 다수의 프로토콜 등 애플리케이션 개발을 위한 각종 구현 요소를 제공한다.
 이번 장에서는 스위프트의 표준 라이브러리를 심도있게 살펴볼 것이다. 특히, 배열, 딕셔너리, 세트, 튜플 등 컬렉션 타입을 매우 상세하게 소개한다.
 */

/*
 struct와 class
 스위프트는 도대체 왜 밸류 타입인 구조체를 써서 레퍼런스 타입인 클래스를 지원하도록 한 것일까?

 1. 성능 최적화
 구조체는 값 타입이므로, 인스턴스를 복사할 때 참조(reference)가 아닌 실제 데이터를 복사합니다. 이는 메모리 관리와 관련된 비용을 줄여 성능을 최적화할 수 있습니다. 특히, 작은 데이터 구조를 빈번히 복사할 때 유리합니다.

 2. 안전성 강화
 값 타입은 불변성을 쉽게 구현할 수 있어, 데이터가 예기치 않게 변경되는 것을 방지합니다. 구조체는 데이터 복사 시 독립된 인스턴스를 생성하므로, 데이터 변경이 원본에 영향을 미치지 않습니다.

 3. 스레드 안전성
 구조체는 값 타입이므로, 여러 스레드에서 동시에 읽고 쓸 때 발생할 수 있는 경쟁 조건을 피할 수 있습니다. 이는 멀티스레드 환경에서 안전하게 사용할 수 있도록 해줍니다.

 4. 간결하고 명료한 설계
 구조체는 단순한 데이터 모델을 구현하는 데 적합합니다. Swift의 많은 기본 데이터 타입(Int, Double, String 등)은 구조체로 구현되어 있어 코드의 간결성과 명료성을 유지할 수 있습니다.

 구조체가 그렇게 강력하다면, 클래스는 언제 써야하는 것인가? -> 가이드라인에 하나라도 충족 된다면 구조체를 쓰라고 권장한다.
 1. 특정 타입 생성의 가장 중요한 목적이 간단한 몇 개의 값을 캡슐화하려는 것인 경우
 2. 캡슐화한 값을 구조체의 인스턴스에 전달하거나 할당할 때 참조가 아닌 복사를 할 경우
 3. 구조체에 의해 저장되는 프로퍼티를 참조가 아닌 복사를 위한 밸류 타입인 경우
 4. 기존의 타입에서 가져온 프로퍼티나 각종 기능을 상속할 필요가 없는 경우
 */

/*
 스위프트에서 배열은 세가지 유형이 있다.
 Array, ContiguousArray, ArraySlice
 모든 array 클래스는 배열에 포함된 배열 요소를 저장하기 위한 메모리공간을 유지한다.배열 요소의 타입이 클래스 또는 @objc 프로토콜 타입이 아닌경우, 배열의 메모리 영역은 인접 블록에 저장된다
 
 */
