import UIKit

/*
 대표적인 정렬의 종류
 1. 삽입 정렬
 2. 병합 정렬 (톱-다운 방식의 정렬 기법인 분리와 정복 디자인 패턴을 따른다.)
 3. 신속 정렬 (톱-다운 방식의 정렬 기법인 분리와 정복 디자인 패턴을 따른다.)
 */

/*
 삽입 정렬
 소규모 데이터 세트에 적합한 방법, 대규모 세트를 처리하기에는 매우 비효율적인 방법이지만, 대상 데이터가 어느정도 정렬되어 있는 경우, 혹은 규묘가 크지 않은 경우 유용하다.
 comparable 프로토콜에 부합하는 타입이어야 한다. -> 반복문을 통해 비교하기 때문에
 N-1회 반복한다.
 
 대표적으로 카드 게임에서 카드 정렬 할 떄 쓰임
 */


func insertionSort<T:Comparable>(_ list: inout [T]) { // inout:  **참조(Reference)**로 전달한다는 의미
    
    if list.count <= 1 {
        return
    }
    
    for i in 1..<list.count { // 첫번째 요소는 이미 정렬된 상태로 간주하여 1번 인덱스부터 돈다.
        let x = list[i] // 현재 위치의 값
        var j = i // 인덱스 추적
        
        while j > 0 && list[j - 1] > x { // 3 > 1
            list[j] = list[j - 1] // arr[1] = 3 -> [3, 3, 2, 5, 4]
            j -= 1
        }
        list[j] = x // arr[0] = 1
    }
    
    
}


var arr = [3, 1, 2, 5, 4]
insertionSort(&arr)

