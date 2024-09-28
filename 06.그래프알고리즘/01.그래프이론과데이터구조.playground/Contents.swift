import UIKit

/*
 그래프 이론
 그래프는 다음 요소로 구성된다.
 1. 꼭지점들의 모음
 2. 모서리들의 모음
 
 꼭지점은 정보 개체를 나타내는 단일 노드를 의미한다.
 모서리는 두 개의 꼭지점의 연결선을 의미한다.
 뭐 이딴걸 어디에쓰는가? -> 네트워크에서 사람들을 어떻게 연결하고 있을지 생각해보자. 소셜 네트워크에 연결된 사람들을 그래프로 표현한다면, 꼭지점은 개별 사용자의 프로필을, 모서리는 이들 사용자의 연결 여부를 나태난다고 볼 수 있다.
 그래프를 이용해서 문제를 해결하고자 한다면, 각각의 시나리오에 적합한 그래프를 선택하는 일이 무척 중요하다. 널리 사용되는 그래프의 유형은 다음과 같다.
 
 무방향성 그래프
 꼭지점을 연결하는 모서리가 양방향성인 그래프를 가리킨다. 즉, 꼭지점 A와 꼭지점 B를 연결하는 모서리를 통해 A에서 B, B에서 A로 이동할 수 있음을 나타낸다.
 무방향성의 대표적인 사례는 한 무리의 친구를 표현하는 방식이다. 양방향성
 
 방향성 그래프
 꼭지점을 한 방향으로만 연결한다.
 
 가중치 그래프
 각각의 모서리에 추가적인 정보 또는 서로 다름 값이 매겨진 그래프 유형이다. (모서리에도 정보가 있다. ex) 걸리는 시간)
 
 그래프의 표현 방식
 
 객체지향 접근법: 구조체와 클래스의 활용
 그래프를 나타내기 위해 객체지향 프로그래밍 기법에 활용되는 구조체와 클래스를 사용하는 방법이다.
 에를 들어 꼭지점 개체를 나타내기 위해 몇 개의 값으로 구성된 프로퍼티를 지닌 구조체를 정의하거나, 모서리 개체를 나타내기 위해 또 다른 구조체를 정의할 수 있다.
 
 이웃목록
 모든 꼭지점을 포함하며, 각각의 이웃 목록에는 그에 연결된 꼭지점 목록이 포함된다.
 A:[C] (A꼭지점은 C 꼭지점과 연결되어 있음)
 B:[C,D] (B꼭지점은 C,D 꼭지점과 연결되어 있음)
 C: [A,B]
 D: [B]
 이 방법을 이용하면 하나의 꼭지점이 다른 것과 서로 연결돼 있는지 여부를 즉각적으로 알 수 있으며, 모든 요소가 아닌 해당 목록만 확인하면 된다.
 이러면 문제가 곂치는 정보가 있는거지 -> A는 C와 연결된다. 라는 정보가 있는데 C에도 A로 간다는 정보가 있지. 그러함으모 이들 요소를 저장하기 위해서는 O(m+n)의 공간이 필요하다,
 
 
 이웃 매틁스
 특정 모서리의 존재 여부를 확인하는 데 특히 유용하지만, 이웃 목록에 비해 좀 더 많은 저장 공간을 차지한다.
 꼭지점의 열과 행으로 하는 매트릭스 또는 행렬을 만든다. 두 개의 꼭지점을 연결하는 머서리가 있다면, 행렬쌍의 값으로 1을 입력하고 그렇지 않다면 0을 입력한다.
 
 A B C D
 A 0 0 1 0
 B 0 0 1 1
 C 1 1 0 0
 D 0 1 0 0
 
 근접 매트릭스
 행이 꼭지점을 나타내고, 열이 모서리를 나타낸다.
 두 개의 꼭지점이 모서리로 연결돼 있는 열에 1을 입력하므로, 각각의 열에는 1이 두 개, 0이 한 개 있게 된다.
 
 1 2 3
 A 1 0 0
 B 0 1 1
 C 1 1 0
 D 0 0 1
 
 이 외에도 그래프를 컴퓨터에서 활용하는 다양한 표현 방식이 있다.
 이제부터는 그래프를 스위프트 데이터 구조로 표현하기 위한 다양한 방법에 대해 알아본다.
 */
/*
 데이터 구조
 구조체, 제네릭, 프로토콜을 이용해서 꼭지점과 모서리 개체를 구현한다.
 가장 먼저, 기본 요소(꼭지점, 모서리)를 만들고, 이들 요소를 활용할 수 있는 데이터 구조(이웃 목록과 그래프)를 완성할 것이다.
 */

// 꼭지점(Vertex) 구조체
public struct Vertex<T: Hashable>: Hashable {
    public var data: T
    public let index: Int
    
    // '==' 연산자를 이용한 비교
    public static func ==(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
        return lhs.data == rhs.data && lhs.index == rhs.index
    }
    
    // 'hash(into:)' 메서드를 구현해 Hashable을 준수
    public func hash(into hasher: inout Hasher) {
        hasher.combine(data)
        hasher.combine(index)
    }
}

// 모서리(Edge) 구조체
public struct Edge<T: Hashable>: Hashable {
    public var from: Vertex<T>
    public var to: Vertex<T>
    
    // '==' 연산자를 이용한 비교
    public static func ==(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
        return lhs.from == rhs.from && lhs.to == rhs.to
    }
    
    // 'hash(into:)' 메서드를 구현해 Hashable을 준수
    public func hash(into hasher: inout Hasher) {
        hasher.combine(from)
        hasher.combine(to)
    }
}

// 이웃 목록 방식을 통해 각 꼭지점이 어떤 꼭지점과 연결되어 있는지 관리하는 기본적인 그래프 데이터 구조를 구현
public struct VertexEdgesList<T: Hashable> {
    // 각각의 VertexEdgesList에는 해당 꼭지점과 그에 연결된 또 다른 꼭지점의 정보를 담고 있는 모서리 배열 데이터가 포함된다
    public let vertex: Vertex<T>
    public var edges: [Edge<T>] = []
    
    init(vertex: Vertex<T>) {
        self.vertex = vertex
    }
    
    public mutating func addEdge(edge: Edge<T>) {
        if self.edges.contains(edge) {
            return
        }
        self.edges.append(edge)
    }
}

// 이웃 목록 그래프 생성
public struct AdjacencyListGraph<T: Hashable> {
    // 각 꼭지점에 대한 **이웃 목록(VertexEdgesList)**을 저장하는 배열이야. 그래서 그래프는 꼭지점들 간의 연결 상태를 이 리스트들을 통해 관리
    public var adjacencyLists: [VertexEdgesList<T>] = []
    
    public var vertices: [Vertex<T>] {
        var vertices = [Vertex<T>]()
        for list in adjacencyLists {
            vertices.append(list.vertex)
        }
        return vertices
    }
    
    public var edges: [Edge<T>] {
        var edgeSet = Set<Edge<T>>()
        for list in adjacencyLists {
            edgeSet.formUnion(list.edges)
        }
        return Array(edgeSet)
    }
    
    public mutating func addVertex(data: T) -> Vertex<T> {
        for list in adjacencyLists {
            if list.vertex.data == data {
                return list.vertex
            }
        }
        
        let vertex = Vertex(data: data, index: adjacencyLists.count)
        let adjacencyList = VertexEdgesList(vertex: vertex)
        adjacencyLists.append(adjacencyList)
        return vertex
    }
    
    public mutating func addEdge(from: Vertex<T>, to: Vertex<T>) -> Edge<T> {
        let edge = Edge(from: from, to: to)
        if let index = adjacencyLists.firstIndex(where: { $0.vertex == from }) {
            adjacencyLists[index].addEdge(edge: edge)
        }
        return edge
    }
    // 그래프 출력
    public func printGraph() {
        for list in adjacencyLists {
            print("Vertex \(list.vertex.data):", terminator: " ")
            for edge in list.edges {
                print("-> \(edge.to.data)", terminator: " ")
            }
            print("")
        }
    }
}
/*
 결론
 이 코드는 다음과 같은 흐름으로 동작해:

 **꼭지점(Vertex)**을 만들고 그 사이를 **모서리(Edge)**로 연결해.
 각각의 꼭지점마다 연결된 이웃 목록(다른 꼭지점들과의 관계)을 관리해.
 전체 그래프는 이러한 여러 꼭지점과 모서리들로 구성돼.
 아주 쉬운 예시로 설명:
 꼭지점 A, B, C가 있다고 생각해봐.
 A에서 B로 가는 길이 있고, A에서 C로도 가는 길이 있어. 이때 A의 이웃 목록에는 B와 C가 있고, 각각 A -> B, A -> C라는 **모서리(Edge)**가 만들어져.
 이 과정이 여러 꼭지점에 대해 반복되면서 그래프가 만들어지는 거야.
 이 코드에서는 실제로 그래프를 만들어서 꼭지점과 모서리를 추가하고, 그래프의 각 부분을 효율적으로 관리할 수 있어.
 */

// 실행 예시
var graph = AdjacencyListGraph<String>()

// 꼭지점 추가
let vertexA = graph.addVertex(data: "A")
let vertexB = graph.addVertex(data: "B")
let vertexC = graph.addVertex(data: "C")
let vertexD = graph.addVertex(data: "D")

// 모서리 추가 (A -> B, A -> C, B -> D)
graph.addEdge(from: vertexA, to: vertexB)
graph.addEdge(from: vertexA, to: vertexC)
graph.addEdge(from: vertexB, to: vertexD)

// 그래프 출력
graph.printGraph()
