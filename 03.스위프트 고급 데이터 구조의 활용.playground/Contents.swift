import UIKit

/*
이 장에서는 컬렉션을 이용해 간단한 애플리케이션을 만들고, 데이터 구조의 활용 방법을 익힙니다.
데이터 구조의 시각화를 통해 데이터의 입력, 출력, 처리 순서를 명확히 정리합니다.
*/

/*
IteratorProtocol, Sequence, Collection 프로토콜에 부합하는 커스텀 컬렉션 타입을 만들면, 네이티브 스위프트 컬렉션 타입처럼 서브스크립트나 for...in 순환문을 통해 요소에 접근할 수 있습니다.
*/

/*
IteratorProtocol은 컬렉션의 반복 상태를 캡슐화하여 next() 메소드를 통해 다음 요소를 반환합니다.
시퀀스의 끝에 도달하면 nil을 반환합니다.
*/
public protocol IteratorProtocol {
    associatedtype Element
    mutating func next() -> Self.Element?
}

/*
Sequence 프로토콜을 준수하는 타입은 makeIterator() 메소드를 통해 이터레이터를 생성하여 for...in 순환문으로 시퀀스를 반복할 수 있습니다.
*/
public protocol Sequence {
    associatedtype Element
    associatedtype Iterator: IteratorProtocol
    func makeIterator() -> Self.Iterator
}

/*
Collection 프로토콜을 준수하는 타입은 다중 경로 시퀀스를 제공하며, startIndex와 endIndex, 그리고 특정 위치에 접근하기 위한 서브스크립트를 정의해야 합니다.
*/
public protocol Collection: Sequence {
    var startIndex: Index { get }
    var endIndex: Index { get }
    subscript(position: Index) -> Element { get }
    func index(after i: Index) -> Index
}

/*
스택은 LIFO (Last In, First Out) 구조를 나타냅니다. 스택에 요소를 추가(push)하고 제거(pop)할 수 있습니다.
*/
struct Stack<T> {
    private var elements = [T]()
    
    mutating func pop() -> T? {
        return elements.popLast()
    }
    
    mutating func push(element: T) {
        elements.append(element)
    }
    
    func peek() -> T? {
        return elements.last
    }
    
    var description: String {
        return elements.description
    }
    
    var debugDescription: String {
        return elements.debugDescription
    }
}

extension Stack: CustomStringConvertible, CustomDebugStringConvertible { }

/*
큐는 FIFO (First In, First Out) 구조를 나타냅니다. 큐에 요소를 추가(enqueue)하고 제거(dequeue)할 수 있습니다.
*/
struct Queue<T> {
    private var elements = [T]()
    
    mutating func enqueue(element: T) {
        elements.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard !elements.isEmpty else { return nil }
        return elements.removeFirst()
    }
    
    func peek() -> T? {
        return elements.first
    }
    
    var description: String {
        return elements.description
    }
    
    var debugDescription: String {
        return elements.debugDescription
    }
}

extension Queue: CustomStringConvertible, CustomDebugStringConvertible { }

/*
순환 버퍼는 고정된 크기의 버퍼로, 마지막 요소에 도달하면 다시 처음으로 돌아갑니다.
*/
struct CircularBuffer<T> {
    private var buffer: [T?]
    private var readIndex = 0
    private var writeIndex = 0
    private var availableSpace: Int
    
    init(size: Int) {
        buffer = Array(repeating: nil, count: size)
        availableSpace = size
    }
    
    mutating func write(_ element: T) -> Bool {
        guard availableSpace > 0 else { return false }
        buffer[writeIndex % buffer.count] = element
        writeIndex += 1
        availableSpace -= 1
        return true
    }
    
    mutating func read() -> T? {
        guard availableSpace < buffer.count else { return nil }
        let element = buffer[readIndex % buffer.count]
        buffer[readIndex % buffer.count] = nil
        readIndex += 1
        availableSpace += 1
        return element
    }
}

/*
우선순위 큐는 각 요소가 우선순위를 가지며, 높은 우선순위를 가진 요소가 먼저 처리됩니다.
*/
struct PriorityQueue<T: Comparable> {
    private var elements = [T]()
    
    mutating func enqueue(_ element: T) {
        elements.append(element)
        elements.sort(by: >)
    }
    
    mutating func dequeue() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
}

/*
스택 리스트는 연결 리스트를 이용한 스택 구현입니다.
*/
class StackNode<T> {
    var value: T
    var next: StackNode?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedListStack<T> {
    private var head: StackNode<T>?
    
    func push(_ value: T) {
        let newNode = StackNode(value: value)
        newNode.next = head
        head = newNode
    }
    
    func pop() -> T? {
        let value = head?.value
        head = head?.next
        return value
    }
    
    func peek() -> T? {
        return head?.value
    }
}
