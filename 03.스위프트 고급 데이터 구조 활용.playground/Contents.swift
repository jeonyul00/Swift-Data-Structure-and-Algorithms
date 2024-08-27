import UIKit

/*
 반복기, 시퀀스, 컬렉션 프토토콜에 부합하는 커스텀 컬렉션 타입을 만들면 네이티브 스위프트 컬력션 타입과 마찬가지로 서브스크립트나 for in 순환문을 통해 개별 요소에 접근 가능하다.
 */

// 반복기: IteratorProtocol 프로토콜에 부합하는 범용 타입, 컬렉션을 반복 순회하는 next() 메소드를 통해 반복상태를 캡슐화한다. 시퀀스에 있는 다음 요소를 반환하거나 시퀀스의 마지막에 이르렀을 경우 nil반환
public protocol IteratorProtocol {
    associatedtype Element
    mutating func next() -> Self.Element?
}

// 시퀀스: Sequence 프로토콜에 부합하는 범용 타입, 시퀀스에 부합하는 타입은 for in 순한문으로 반복 순회할 수 있다.
public protocol Sequence {
    associatedtype Iterator: IteratorProtocol
    func makeIterator() -> Self.Iterator // 보통의 경우 이 메소드를 직접 호출할 필요가 없으며, 스위프트 런타임이 for in 순환문을 사용할 때 자동으로 호출한다.
}

// 컬렉션: Collection 프로토콜에 부합하는 범용 타입, 위치를 특정할 수 있는 다중 경로 시퀀스를 제공, 순회하면서 많은 요소를 인덱스 값으로 저장한 뒤 필요할 때 해당 인덱스 값으로 특정 요소를 가져올 수 있는 방법을 제공
// Collection 프로토콜은 Sequence 프로토콜과 Indexable 프로토콜에도 부합한다. Collection 프로토콜에 부합하는 타입을 만들기 위해서는 다음 네 가지를 정의해야 한다.
// 1. startIndex 프로퍼티와 endIndex 프로퍼티
// 2. 컬렉션에서 특정 인덱스 위치에 삽입하기 위한 index(after:) 메소드
// 3. 커스텀 타입 요소에 읽기전용 이상의 권한으로 접근하기 위한 서브스크립트
/*
 모든 변수가 저 세 가지 중 하나의 타입을 상속받고 있는 것은 아닙니다. Swift의 변수들은 다양한 타입을 가질 수 있으며, 저 세 가지 프로토콜(IteratorProtocol, Sequence, Collection)은 특정 상황에서만 사용됩니다.
 
 변수 타입에 대한 일반적인 설명:
 기본 타입들:
 
 Swift에서 가장 많이 사용되는 기본 타입들은 Int, String, Double, Bool 등입니다. 이러한 타입들은 저 세 가지 프로토콜과는 직접적인 관련이 없습니다.
 컬렉션 타입들:
 
 배열(Array), 집합(Set), 딕셔너리(Dictionary) 등은 Collection 프로토콜을 채택하고 있습니다. 따라서 이들은 Collection 프로토콜을 상속받고 있다고 볼 수 있습니다.
 예를 들어, 배열(Array)은 Collection 프로토콜을 채택하고 있으므로, 이 프로토콜이 요구하는 메서드와 프로퍼티를 구현하고 있습니다.
 Sequence와 IteratorProtocol:
 
 Sequence 프로토콜은 for-in 루프에서 사용할 수 있는 타입이 따릅니다. 많은 Swift의 기본 컬렉션 타입들은 이 Sequence 프로토콜을 따릅니다.
 IteratorProtocol은 주로 Sequence와 함께 사용되며, 반복기를 정의하는 데 사용됩니다. 하지만 모든 타입이 IteratorProtocol이나 Sequence를 따르는 것은 아닙니다.
 요약하자면:
 모든 변수들이 IteratorProtocol, Sequence, Collection 중 하나의 타입을 상속받고 있는 것은 아닙니다.
 이들 프로토콜은 특정 상황에서만 사용되며, 특히 반복, 순회, 컬렉션 관리와 관련된 기능을 제공하는 타입들이 이를 채택합니다.
 Swift의 변수들은 다양한 타입을 가질 수 있으며, 저 세 가지 프로토콜은 이 중 특정 타입들(주로 컬렉션 관련)에만 해당됩니다.
 */

// ---------
/*
스택: LIFO데이터 구조를 나타낸다. 개별 요소 접근에 강하게 제한한다.
 */

public struct Stack<T> {
    private var elements = [T]()
    
    init() {}
    
    public mutating func pop() -> T? {
        return self.elements.popLast()
    }
    
    public mutating func push(_ element: T) {
        self.elements.append(element)
    }
    
    public func peek() -> T? {
        return self.elements.last
    }
    
}

// 큐: FIFO데이터 구조를 나타낸다.
public struct Queue<T> {
    private var data = [T]()
    
    init(){}
    
    /// 큐에서 첫 번째 요소를 제거하고 반환
    public mutating func dequeue() -> T? {
        return data.removeFirst()
    }
    
    /// 큐에서 첫 번째 요소를 제거하지 않고 반환
    public mutating func peek() -> T? {
        return data.first
    }
    
    // etc
    
    /// 큐의 용량 반환 : get set
    public var capacity:Int {
        get { return data.capacity }
        set { data.reserveCapacity(newValue) }
    }
}
