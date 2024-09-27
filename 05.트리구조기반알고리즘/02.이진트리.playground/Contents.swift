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

print(rootNode)


//
//class Node<T:Comparable> {
//    var value: T
//    var left: Node?
//    var right: Node?
//    var parent: Node?
//    
//    
//    init(value: T, left: Node? = nil, right: Node? = nil, parent: Node? = nil) {
//        self.value = value
//        self.left = left
//        self.right = right
//        self.parent = parent
//    }
//
//    
//    public func guardInsert(_ value:T){
//        if self.parent != nil { return }
//        insert(value)
//    }
//    
//    private func insert(_ value:T) {
//        // 왼쪽으로
//        if value < self.value {
//            // 왼쪽 노드가 있냐없냐
//            if let leftChild = left {
//                leftChild.insert(value)
//            } else {
//                // 왼쪽에서 노드를 하나 새로만들어야지.
//                let newNode = Node(value: value)
//                newNode.parent = self
//                self.left = newNode
//            }
//        } else {
//            // 큰 수 오른쪽
//        }
//        
//    }
//    
//    
//}
