import UIKit

/*
 병합 정렬은은 분리 정복 알고리즘으로, 정렬에 따른 시간 소모가 삽입 정렬에 비해 적다.
 재귀적으로 작동하며
 1.분리: 미정렬 상태의 데이터 세트를 두개로 나누는 일을 반복하여 데이터 세트에 속한 아이템이 하나인 상태가 되거나 빈 상태가 되면 정렬된 상태로 판단한다.
 이를 더 이상 분해할 수 없는 최소 단위 요소 또는 베이스 케이스라고 부른다.
 2.정복: 이후 대부분의 정렬 작업은 함수에서 수행하며, 나뉘어 있는 두 개의 요소를 다시 하나로 합치는 일을 반복한다.
 */

// 배열을 작게 나눈 후, 그 작은 배열들을 하나씩 병합하면서 정렬하는 것.

// 정복, 병합
func merge<T:Comparable>(_ leftHalf: [T], _ rightHalf:[T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    var tempList = [T]()
    
    // 공간 미리 예약: 이거 왜 이런지는 나중에 설명함. 필수는 아니지만 이것이 더 효율적임
    tempList.reserveCapacity(leftHalf.count + rightHalf.count)
    
    while (leftIndex < leftHalf.count && rightIndex < rightHalf.count) { // 요소의 수 만큼 반복
        // 왼쪽이 더 작을 경우
        if leftHalf[leftIndex] < rightHalf[rightIndex] {
            tempList.append(leftHalf[leftIndex])
            leftIndex += 1
        } else if  leftHalf[leftIndex] > rightHalf[rightIndex] { // 오른쪽이 더 작을 경우
            tempList.append(rightHalf[rightIndex])
            rightIndex += 1
        } else {
            // 값이 같을 경우
            tempList.append(leftHalf[leftIndex])
            tempList.append(rightHalf[rightIndex])
            leftIndex += 1
            rightIndex += 1
        }
    }
    
    tempList += [T](leftHalf[leftIndex..<leftHalf.count])
    tempList += [T](rightHalf[rightIndex..<rightHalf.count])
    return tempList
    
}

func mergeSort<T:Comparable>(_ list: [T])->[T]{
    
    guard list.count > 1 else { return list } // 결국 얘가 리턴됨
    
    // 분할
    let center:Int = list.count / 2
    let leftHalf = Array(list[0..<center])
    let rightHalf = Array(list[center..<list.count])
    
    // 정복, 더 이상 나눠지지 않을 때까지 호출
    return merge(mergeSort(leftHalf), mergeSort(rightHalf))
}

let array = [10, 3, 2, 7, 8, 4]
print(mergeSort(array))
