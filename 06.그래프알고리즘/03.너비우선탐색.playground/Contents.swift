import UIKit

/*
 너비 우선 탐색
 동일 레벨 혹은 노드를 방문하는 방법에 초점을 맞춘 순회 기법이다.
 이 기법의 또 다른 특징은 각각의 노드를 단 한 번만 방문한다는 것이다.
 
 BFS 기법을 활용하려면 다음과 같은 정보를 포함한 데이터 구조가 필요하다.
 1. 노드를 식별하기 위한 값(노드 이름 등)
 2. 연결 노드의 목록
 3. 특정 노드에 대한 방문 여부 표시 -> BFS는 각각의 노드를 단 한 번만 방문해야 한다는 점을 기억하자
 */

public class BFSNode<T> {
    public var value:T // 나의 값
    public var neighbours:[BFSNode] // 이웃과 연결된 배열
    public var visited:Bool // 방문상태
    
    init(value: T, neighbours: [BFSNode], visited: Bool) {
        self.value = value
        self.neighbours = neighbours
        self.visited = visited
    }
    
    // bfs
    public static func breadthFirstSearch(first:BFSNode){
        // 큐 초기화
        var queue:[BFSNode] = []
        
        // 루트 노드에서 시작
        queue.append(first)
        
        // 큐에서 노드 방문 시작
        while queue.isEmpty == false {
            if let node = queue.first {
                // 현재 노드의 값을 출력하고 방문 표식 남기기
                print(node.value)
                node.visited = true
                // 큐에 아직 방문하지 않은 이웃을 추가
                for neighbour in node.neighbours {
                    if neighbour.visited == false {
                        queue.append(neighbour)
                    }
                }
                // 이미 처리한 노드는 삭제, 큐의 나머지 요소에 대한 처리는 지속
                queue.removeFirst()
            }
        }
        
    }
    
    // 예제를 위한 도우미 메소드
    public func addNeighbours(node:BFSNode){
        self.neighbours.append(node)
        node.neighbours.append(self)
    }
}


let nodeA = BFSNode(value: "A", neighbours: [], visited: false)
let nodeB = BFSNode(value: "B", neighbours: [], visited: false)
let nodeC = BFSNode(value: "C", neighbours: [], visited: false)
let nodeD = BFSNode(value: "D", neighbours: [], visited: false)
let nodeE = BFSNode(value: "E", neighbours: [], visited: false)
let nodeF = BFSNode(value: "F", neighbours: [], visited: false)

// 노드 연결
nodeA.addNeighbours(node: nodeB)
nodeA.addNeighbours(node: nodeC)
nodeB.addNeighbours(node: nodeD)
nodeB.addNeighbours(node: nodeE)
nodeC.addNeighbours(node: nodeF)

// BFS 탐색 시작
BFSNode.breadthFirstSearch(first: nodeA)
