import UIKit

/*
 몇 가지 정렬 알고리즘 방식을 구현하면서 알고리즘의 차이를 파악하고 메모리에서 정렬 알고리즘을 처리하기 위한 분리와 정복 전략에 대해서도 생각해본다.
 1. 삽입 정렬: 소규모 데이터 처리에 적합
 2. 병합 정렬: 분리 정복 디자인 패턴
 3. 신속 정렬: 분리 정복 디자인 패턴
 */

// 삽입 정렬: 대규모 데이터를 처리하기에는 매우 비효율적 -> 대상 데이터가 이미 어느 정도 정렬되어 있는 경우, 혹은 규모가 크지 않은 경우 유용함, 순서를 약간만 바꿔도 될 때 ex) 카드 게임
func insertionSort<T:Comparable>(_ list: inout [T]) {
    guard list.count > 0 else { return }
    for i in 1..<list.count {
        let j = list[i]
        var k = i
        while k > 0 && list[k - 1] > j {
            list[k] = list[k - 1]
            k -= 1
        }
        list[k] = j
    }
}

var insertList = [1,4,5,2,3,4,4,7,5,0,4,4,8,2,3,222,2,1,2,48,48,1,9,6,2]
insertionSort(&insertList)
print(insertList)

/*
 병합 정렬: 분리정복 알고리즘으로, 정렬에 따른 시간소모가 삽입 정렬보다 적다. 병합 정렬은 재귀적으로 작동하며
 미정렬 상태의 데이터를 두 개로 나누는 일을 반복해서 데이터의 요소가 하나 또는 빈 상태가 되면 정렬된 상태로 판단하며, 이를 더이상 분해할 수 없는 최소 단위 여소 또는 베이스케이스라고 부른다.
 이후 대부분의 정렬 작업은 merge함수에서 수행하며, 나뉘어 있는 두 개의 요소를 하나로 합치는 일을 반복한다.
 merge함수는 병합 작업을 위해 동일한 크기의 배열을 임시로 만들어서 사용하므로 -
 이런 이유로 병합 정렬은 배열보다는 연결 목록(linked list)의 정렬 작업에 좀 더 나은 성능을 발휘한다.
 */

/*
 배열 기반 병합 정렬 알고리즘
 세 가지 절차를 따른다.
 1. 분리: 칼렉션 S의 길이가 2 이상일 때, 컬렉션은 S1, S2로 나눈다. 이때, S1에는 N/2만큼의 요소가 포함되어 있고, 나머지 S2에는 S의 나머지 N/2만큼의 요소가 포함되어 있다.
 2. 정복: S1과 S2를 재귀적으로 나눠서 요소의 수가 1인 베이스 케이스 단계까지 나눈 뒤 정렬을 시작한다.
 3. 결합: S1과 S2의 하위 목록을 병합해서 정렬된 시퀀스로 만든 귀 이를 다시 반환한다.
 */

func mergeSort<T:Comparable>(_ list: [T])-> [T] {
    guard list.count > 1 else { return list }
    
    let mid = list.count / 2
    return merge(mergeSort([T] (list[0..<mid])), rightHalf: mergeSort([T] (list[mid..<list.count])))
}

func merge<T:Comparable>(_ leftHalf: [T], rightHalf: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    var tempList = [T]()
    tempList.reserveCapacity(leftHalf.count + rightHalf.count)
    
    while (leftIndex < leftHalf.count && rightIndex < rightHalf.count) {
        if leftHalf[leftIndex] < rightHalf[rightIndex] {
            tempList.append(leftHalf[leftIndex])
            leftIndex += 1
        } else if leftHalf[leftIndex] > rightHalf[rightIndex] {
            tempList.append(rightHalf[rightIndex])
            rightIndex += 1
        } else {
            tempList.append(leftHalf[leftIndex])
            tempList.append(rightHalf[rightIndex])
            leftIndex += 1
            rightIndex += 1
        }
    }
    tempList += [T] (leftHalf[leftIndex ..< leftHalf.count])
    tempList += [T] (rightHalf[rightIndex ..< rightHalf.count])
    return tempList
}
