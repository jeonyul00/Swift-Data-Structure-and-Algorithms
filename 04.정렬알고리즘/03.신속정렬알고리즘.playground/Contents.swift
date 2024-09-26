import UIKit

/*
 신속 정렬(퀵소트) 기법 역시 분리정복 알고리즘의 일종이다.
 병합 정렬과 다른 점은 신속 정렬의 경우 분할하는 과정에서 피벗을 설정하여 작동한다.
 피벗(일반적으로 첫번째 요소나 마지막 요소를 사용)을 기준으로 작은 값은 왼쪽, 큰 값은 오른쪽으로 정렬된 두 부분으로 나눈 후 각각을 재귀적으로 정렬한다.
 
 신속 정렬이 평균적으로 더 빠르게 동작하지만, 최악의 경우 시간이 많이 걸릴 수 있는 반면, 병합 정렬은 시간 복잡도가 안정적입니다. 병합 정렬은 메모리 사용량이 더 많지만, 안정적인 정렬을 보장하는 장점이 있습니다.
 */


// 로무토 신속 정렬
func partition<T: Comparable>(_ list: inout [T], _ lo: Int, _ hi: Int) -> Int {
    let pivot = list[hi]
    var i = lo
    
    for j in lo..<hi {
        if list[j] <= pivot {
            list.swapAt(i, j)  // 피벗보다 작은 값을 왼쪽으로 보낸다. -> list의 i번째 요소와 j번째 요소의 값 교환
            i += 1
        }
    }
    list.swapAt(i, hi)  // 피벗을 제자리로 보낸다.
    return i
}


// 호어 신속 정렬
func partitionHoare<T: Comparable>(_ list: inout [T], _ lo: Int, _ hi: Int) -> Int {
    let pivot = list[(lo + hi) / 2]  // 중간 값을 피벗으로 선택
    var left = lo - 1
    var right = hi + 1
    
    while true {
        repeat { left += 1 } while list[left] < pivot  // 왼쪽에서 피벗보다 큰 값을 찾는다
        repeat { right -= 1 } while list[right] > pivot // 오른쪽에서 피벗보다 작은 값을 찾는다
        
        if left >= right {
            return right  // 교차되면 분할을 끝낸다
        }
        
        list.swapAt(left, right)  // 찾은 두 값을 교환
    }
}



func quickSort<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) {
    if lo < hi {
        let p = partition(&list, lo, hi)  // 피벗을 기준으로 배열을 분할
        quickSort(&list, lo: lo, hi: p - 1)  // 피벗보다 작은 부분 정렬
        quickSort(&list, lo: p + 1, hi: hi)  // 피벗보다 큰 부분 정렬
    }
}

var arr = [10, 80, 30, 90, 40, 50, 70]
quickSort(&arr, lo: 0, hi: arr.count - 1)
print(arr)
