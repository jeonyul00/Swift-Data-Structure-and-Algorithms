import UIKit

/*
 DFS: 깊이 우선 탐색
 깊이 우선 탐색(DFS)은 트리나 그래프에서 한 노드의 자식을 따라 끝까지 탐색한 뒤, 다시 부모로 돌아가서 다른 자식을 탐색하는 방식이다.
 좌측 자식을 먼저 탐색하고, 그다음에 노드 자신을 탐색하며, 마지막으로 우측 자식을 탐색하는 순서다.
 */

class TreeNode<T: Comparable> {
    var value: T
    var leftChild: TreeNode?
    var rightChild: TreeNode?
    weak var parent: TreeNode?

    init(value: T, leftChild: TreeNode? = nil, rightChild: TreeNode? = nil, parent: TreeNode? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
        self.parent = parent
    }

    // 루트 노드부터 새 노드를 삽입하는 함수
    public func insertNodeFromRoot(value: T) {
        if let _ = self.parent {
            return
        }
        self.addNode(value: value)
    }

    // 새 노드를 추가하는 함수
    private func addNode(value: T) {
        if value < self.value {
            if let leftChild = leftChild {
                leftChild.addNode(value: value)
            } else {
                let newNode = TreeNode(value: value)
                newNode.parent = self
                leftChild = newNode
            }
        } else {
            if let rightChild = rightChild {
                rightChild.addNode(value: value)
            } else {
                let newNode = TreeNode(value: value)
                newNode.parent = self
                rightChild = newNode
            }
        }
    }

    // 깊이 우선 탐색 (DFS) 함수
    public func DFS(node: TreeNode?) {
        // 노드가 없으면 재귀 종료
        guard let node = node else {
            return
        }
        // 왼쪽 자식 탐색
        DFS(node: node.leftChild)
        // 현재 노드 출력
        print(node.value)
        // 오른쪽 자식 탐색
        DFS(node: node.rightChild)
    }
}

/*
 트리 구조 다시 설명
 트리는 기본적으로 노드들이 연결된 구조야. 각 노드는 자식 노드를 가질 수 있고, 자식은 없을 수도 있어. 트리의 루트에서 출발해서 각 노드를 탐색하는 방법 중 하나가 **깊이 우선 탐색(DFS)**이야.

 DFS 다시 쉽게 설명
 **DFS(깊이 우선 탐색)**은 트리나 그래프에서 한 번에 하나의 경로를 끝까지 탐색하는 방식이야. 아래처럼 작동해:

 왼쪽 자식 노드를 먼저 탐색해.
 더 이상 자식이 없으면, 그 **노드를 방문(출력)**해.
 그리고 오른쪽 자식 노드로 넘어가서 탐색을 이어가.

    10
   /  \
  5    15
 / \     \
3   7    20

 DFS는 이 트리에서 아래처럼 동작해:

 **루트 노드(10)**에서 시작해서 **왼쪽 자식(5)**으로 이동해.
 5의 **왼쪽 자식(3)**으로 이동.
 3은 더 이상 자식이 없으니까 그 값을 출력해: 3
 5로 돌아와서 5 자신을 출력해: 5
 5의 **오른쪽 자식(7)**으로 이동.
 7도 자식이 없으니 값을 출력해: 7
 이제 루트로 돌아가서 10을 출력해: 10
 10의 **오른쪽 자식(15)**으로 이동.
 15의 왼쪽 자식은 없으니까 바로 15를 출력해: 15
 15의 **오른쪽 자식(20)**으로 이동.
 20도 자식이 없으니 값을 출력해: 20
 
 3 -> 5 -> 7 -> 10 -> 15 -> 20

 이렇게 한 노드의 왼쪽 자식부터 끝까지 탐색하고, 그다음에 노드 자신을 출력한 후, 오른쪽 자식을 탐색하는 방식이 DFS의 핵심이야.

 코드 설명
 TreeNode 클래스: 각 노드에 값을 저장하고, 왼쪽 자식(leftChild)과 오른쪽 자식(rightChild)을 저장하는 구조야.
 insertNodeFromRoot: 이 함수는 트리의 루트 노드부터 새 값을 삽입하는 함수야. 트리 구조에 따라 왼쪽이나 오른쪽에 값을 넣어.
 addNode: 새로운 값을 트리에 추가하는 함수야. 현재 노드보다 작으면 왼쪽 자식에, 크면 오른쪽 자식에 추가해.
 DFS: 깊이 우선 탐색을 구현한 함수야. 이 함수는 재귀적으로 왼쪽 자식부터 탐색하고, 그다음에 노드 자신을 출력하고, 오른쪽 자식을 탐색해.

 */
