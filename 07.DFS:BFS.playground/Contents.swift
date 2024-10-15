import UIKit

public class TreeNode<T:Comparable> {
    public var value: T
    public var leftChild: TreeNode?
    public var rightChild: TreeNode?
    public var parent: TreeNode?
    
    init(value: T, leftChild: TreeNode? = nil, rightChild: TreeNode? = nil, parent: TreeNode? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
        self.parent = parent
    }
    
    func dfs(_ node: TreeNode?) {
        guard let node = node else { return }
        
        node.dfs(node.leftChild)
        print(node.value)
        node.dfs(node.rightChild)
    }

}

let root = TreeNode(value: 10)
let node1 = TreeNode(value: 5)
let node2 = TreeNode(value: 15)
let node3 = TreeNode(value: 3)
let node4 = TreeNode(value: 7)
let node5 = TreeNode(value: 12)
let node6 = TreeNode(value: 18)
root.leftChild = node1
root.rightChild = node2
node1.leftChild = node3
node1.rightChild = node4
node2.leftChild = node5
node2.rightChild = node6

root.dfs(root)

// ---

public class BFSNode<T> {
    public var value: T
    public var neighbors: [BFSNode]  // 인접한 이웃 노드들
    public var isVisited: Bool
    
    init(value: T, neighbors: [BFSNode] = [], isVisited: Bool = false) {
        self.value = value
        self.neighbors = neighbors
        self.isVisited = isVisited
    }
}

func bfs(startNode: BFSNode<Int>) {
    var queue: [BFSNode<Int>] = [startNode]  // 큐를 이용해 노드를 탐색
    startNode.isVisited = true  // 시작 노드를 방문했다고 표시
    
    while !queue.isEmpty {
        let currentNode = queue.removeFirst()  // 큐에서 가장 앞의 노드를 꺼냄
        print(currentNode.value)  // 현재 노드의 값 출력
        
        // 현재 노드의 이웃들을 차례로 탐색
        for neighbor in currentNode.neighbors {
            if !neighbor.isVisited {
                neighbor.isVisited = true  // 이웃 노드를 방문했다고 표시
                queue.append(neighbor)  // 큐에 이웃 노드를 추가
            }
        }
    }
}

// BFS 탐색할 노드들 생성
let node10 = BFSNode(value: 1)
let node20 = BFSNode(value: 2)
let node30 = BFSNode(value: 3)
let node40 = BFSNode(value: 4)
let node50 = BFSNode(value: 5)
let node60 = BFSNode(value: 6)

// 이웃 연결
node10.neighbors = [node20, node30]
node20.neighbors = [node40, node50]
node30.neighbors = [node60]

// BFS 탐색 시작
bfs(startNode: node10)
