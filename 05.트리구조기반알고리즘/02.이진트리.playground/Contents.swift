import UIKit

/*
 이진트리
 앞서 살펴본 것처럼, 이진 트리는 최대 두 개의 자식 노드를 지닐 수 있는 트리 데이터 구조다 -> 이진 트리의 모든 노드(무한대는 아닌)가 일정한 수의 자식 노드만을 지닌다는 점
 
 풀 이진 트리: 트리 내의 특정 노드 N이 있을 때, N은 0개 혹은 2개의 자식 노드를 지닌다. (1개인 경우는 없다.)
 퍼펙트 이진 트리: 모든 내부 노드는 두 개의 노드를 지니며, 모든 잎은 동일한 깊이를 지닌다.
 컴플리트 이진 트리: 마지막 레벨을 제외한 모든 레벨이 노드로 완전하게 찬 상태
 균형 이진 트리: 잎 노드까지 이어지기 위한 최소한의 높이만을 지닌다.
 
 이진 트리를 구현하기 위해서는 데이터 구조에 포함된 노드가 다음과 같은 조건을 갖추고 있어야 한다.
 1. 키 데이터 값을 포함한 컨테이너
 2. 좌, 우측 자식 노드에 대한 두 개의 참조값
 3. 부모 노드에 대한 참조값
 */

// 이진 트리 구현
public class BinaryTreeNode<T: Comparable> {
    
    // 노드가 담고 있는 값 (예: 10, 5, 15 등)
    public var value: T
    
    // 좌측 자식 노드 (이 노드의 값보다 작은 값을 가짐)
    public var leftChild: BinaryTreeNode?
    
    // 우측 자식 노드 (이 노드의 값보다 큰 값을 가짐)
    public var rightChild: BinaryTreeNode?
    
    // 부모 노드 (이 노드를 포함하는 상위 노드, 순환 참조 방지를 위해 weak 사용)
    public weak var parent: BinaryTreeNode?
    
    // 노드를 초기화하는 기본 생성자
    public init(value: T) {
        self.value = value  // 노드의 값 설정
        self.leftChild = nil  // 처음에는 자식 노드가 없으므로 nil로 설정
        self.rightChild = nil  // 처음에는 자식 노드가 없으므로 nil로 설정
        self.parent = nil  // 처음에는 부모 노드도 없으므로 nil로 설정
    }
    
    // 커스텀 생성자: 이 생성자를 통해 자식과 부모 노드를 직접 설정 가능
    public init(value: T, leftChild: BinaryTreeNode?, rightChild: BinaryTreeNode?, parent: BinaryTreeNode?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
        self.parent = parent
    }
    
    // 루트 노드에서만 노드를 삽입하기 위한 메서드
    // 이 메서드는 반드시 트리의 루트에서 호출되어야 함
    public func insertNodeFromRoot(_ value:T) {
        // self.parent가 nil이 아니면 루트가 아니므로 삽입하지 않음
        guard self.parent == nil else {
            return
        }
        // 루트 노드라면 addNode 메서드를 통해 값을 삽입함
        self.addNode(value)
    }
    
    // 이진 탐색 트리 규칙을 따르며 노드를 삽입하는 메서드
    // 값이 현재 노드보다 작으면 왼쪽, 크면 오른쪽에 삽입
    private func addNode(_ value:T) {
        // 삽입하려는 값이 현재 노드의 값보다 작으면
        if value < self.value {
            // 왼쪽 자식이 이미 존재하면 그 자식 노드에 재귀적!!!!으로 삽입
            if let leftChild = leftChild {
                leftChild.addNode(value)
            } else {
                // 왼쪽 자식이 없으면 새로운 노드를 왼쪽 자식으로 추가
                let newNode = BinaryTreeNode(value: value)
                newNode.parent = self  // 새로 추가한 노드의 부모는 현재 노드
                leftChild = newNode  // 현재 노드의 왼쪽 자식으로 설정
            }
        }
        // 삽입하려는 값이 현재 노드의 값보다 크거나 같으면
        else {
            // 오른쪽 자식이 이미 존재하면 그 자식 노드에 재귀적으로 삽입
            if let rightChild = rightChild {
                rightChild.addNode(value)
            } else {
                // 오른쪽 자식이 없으면 새로운 노드를 오른쪽 자식으로 추가
                let newNode = BinaryTreeNode(value: value)
                newNode.parent = self  // 새로 추가한 노드의 부모는 현재 노드
                rightChild = newNode  // 현재 노드의 오른쪽 자식으로 설정
            }
        }
    }
}

let rootNode = BinaryTreeNode(value:10)

// 트리에 값 삽입 (5, 15, 2, 7, 12, 17)
rootNode.insertNodeFromRoot(5)
rootNode.insertNodeFromRoot(15)
rootNode.insertNodeFromRoot(2)
rootNode.insertNodeFromRoot(7)
rootNode.insertNodeFromRoot(12)
rootNode.insertNodeFromRoot(17)



// 트리 워크(순회)
/*
 인오더 트리 워크
 이진 검색 트리의 속성에 따라 인오더 트리 워크, 인오더 트래버설이라는 이름의 알고리즘으로 트리 내부의 노드를 순회할 수 있다.
 인오더 트리 워크를 하고 하면 오름차순으로 정렬된 트리 노드의 값이 목록으로 반환된다.
 인오더 트리 워크는 다음 순서에 따라 루트 노드에 속한 각각의 서브 트리를 재귀적으로 방문한다.
 
 좌측 서브 트리 -> 루트 노드 -> 우측 서브 트리
 좌측 < 루트 노드 < 우측
 이런 이유로, 인오더 트리 워크의 결과값은 오름차순으로 정돈된 시퀀스가 된다.
 */


// 인오더 트리 워크
extension BinaryTreeNode {
    // 재귀적으로 노드를 순회하는 인오더 트리 워크
    public class func traverseInOrder(node:BinaryTreeNode?) {
        // nil인 잎에 도달하면 재귀적인 함수 호출이 중단됨
        guard let node = node else { return }
        
        // leftChild에서 재귀적으로 메소드 호출 후에 rightChild로 이동
        BinaryTreeNode.traverseInOrder(node: node.leftChild)
        print(node.value)
        BinaryTreeNode.traverseInOrder(node: node.rightChild)
        
    }
}

BinaryTreeNode.traverseInOrder(node: rootNode)

/*
 프리 오더 트리 워크
 루트 노드 -> 좌측 서브트리 -> 우측 서브트리
 */
extension BinaryTreeNode {
    public class func traverseInOrder2(node:BinaryTreeNode?) {
        guard let node = node else { return }
        print(node.value)
        BinaryTreeNode.traverseInOrder2(node: node.leftChild)
        BinaryTreeNode.traverseInOrder2(node: node.rightChild)
        
    }
}

BinaryTreeNode.traverseInOrder2(node: rootNode)

/*
 포스트오더 트리 워크
 좌측 서브 트리 -> 우측 서브 트리 -> 루트 노드
 */

extension BinaryTreeNode {
    public class func traverseInOrder3(node:BinaryTreeNode?) {
        guard let node = node else { return }
        
        BinaryTreeNode.traverseInOrder3(node: node.leftChild)
        BinaryTreeNode.traverseInOrder3(node: node.rightChild)
        print(node.value)
    }
}



/*
 탐색, 검색
 노드에 포함돼 있는 값을 키로 삼아서 특정 노드를 검색할 수 있는 메소드를 구현한다.
 만일, 그런 값이 없다면 옵셔널 객체 내에서 nil을 반환하도록 한다.
 */

extension BinaryTreeNode {
    func search(value:T) -> BinaryTreeNode? {
        // 키 값을 찾은 경우
        if value == self.value {
            return self // 결국 얘가 나감
        }
        
        // 해당 키 값이 현재 노드의 키 값보다 작은 경우
        // 좌측 서브트리에서 재귀적으로 검색을 시작
        // 그렇지 않은 경우 우측 서브트리에서 검색 시작
        if value < self.value {
            guard let left = leftChild else { return nil }
            return left.search(value: value)
        } else {
            guard let right = rightChild else { return nil }
            return right.search(value: value)
        }
    }
}

/*
 삭제
 삭제의 경우 그에 따르는 다양한 상황을 미리 구체적으로 알고 있어야하기 때문에 삽입, 검색에 비해 훨씬 까다롭다.
 
 이진 트리에서 노드 삭제의 세 가지 주요 경우:
 삭제할 노드가 자식이 없는 경우 (leaf node): 그냥 부모와의 연결을 끊으면 됨.
 삭제할 노드가 하나의 자식만 있는 경우: 삭제된 노드의 부모와 자식을 직접 연결해야 함.
 삭제할 노드가 두 자식을 모두 가지고 있는 경우: 오른쪽 서브트리에서 최소값을 찾아서 그 노드와 삭제할 노드를 교환한 후, 교환한 노드를 삭제.
 */


// 노드 삭제
extension BinaryTreeNode {
    public func delete() {
        if let left = leftChild {
            if let _ = rightChild {
                // 대상 노드가 좌우측 두개의 자식 요소를 모두 지닌 경우 -> 후손 교환 작업 실행
                self.exchangeWithSuccessor()
            } else {
                // 대상 노드가 좌측 자식 요소를 지닌 경우 -> 대상 노드의 self.parent와 self.child를 바로 연결함
                self.connectParentTo(child:left)
            }
        } else if let right = rightChild {
            self.connectParentTo(child:right)
        } else {
            self.connectParentTo(child:nil)
        }
        
        // 참조값 삭제
        self.parent = nil
        self.leftChild = nil
        self.rightChild = nil
    }
    
    // 삭제 대상 노드의 후손을 위해 노드 교환 실행
    private func exchangeWithSuccessor() {
        guard let right = self.rightChild, let left = self.leftChild else { return }
        
        let successor = right.minimum()
        
        successor.delete()
        successor.leftChild = left
        left.parent = successor
        
        if right !== successor {
            successor.rightChild = right
            right.parent = successor
        } else {
            successor.rightChild = nil
        }
        self.connectParentTo(child:successor)
    }
    
    // 부모와 자식을 연결하는 함수
    private func connectParentTo(child: BinaryTreeNode?) {
        guard let parent = self.parent else {
            child?.parent = self.parent
            return
        }
        if parent.leftChild === self {
            parent.leftChild = child
            child?.parent = parent
        } else {
            parent.rightChild = child
            child?.parent = parent
        }
    }
    
    // 오른쪽 서브트리에서 가장 작은 노드 찾기
    public func minimum() -> BinaryTreeNode {
        var node = self
        while let next = node.leftChild {
            node = next
        }
        return node
    }
}
