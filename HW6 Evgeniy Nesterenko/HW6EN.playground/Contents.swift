import UIKit

var greeting = "Hello, playground"

// 1. Создайте два массива. Первый от 0 до 14, второй от 14 до 30. Объедините их в один массив.

let a1 = Array(0...14)
let a2 = Array(14...30)
let a3 = a1 + a2
print(a3)


// 2. Создать функцию, которая принимает массив int. Возвести все Int в квадрат. Возвратить новый массив.

func squareNumber(in array: [Int]) -> [Int] {
    return array.map { $0 * $0 }
}

let squareResult = squareNumber (in: a3)
print(squareResult)


// 3. Создать функцию, которая принимает массив int. Возвратить новый массив только с четными элементами.

func evenNumbers(in array: [Int]) -> [Int] {
    return array.filter { $0 % 2 == 0 }
}

let evenResult = evenNumbers (in: a3)
print(evenResult)


// 4. Написать 3 примера с использованием .map

// Пример с прибавлением
let c1 = a3.map { $0 + 5 }
print(c1)

// Пример с умножением
let c2 = a3.map { $0 * 7 }
print(c2)

// Пример с возведением в String
let c3 = a3.map { "\($0)" }
print(c3)

// Пример с делением
let c4 = a3.map { $0 / 2 }
print(c4)


// 5. Написать 2 примера с использованием .filter

let b1 = a3.filter { $0 < 15}
print(b1)

let b2 = a3.filter { $0 > 15 }
print(b2)

let b3 = a3.filter { $0 <= 21}
print(b3)

let b4 = a3.filter { $0 >= 21}
print(b4)

let b5 = a3.filter { $0 == 3}
print(b5)


// 6. Написать 2 примера с использованием .compactMap

let x1 = ["5", "Apple", "55", "Inc", "555"]
let s1 = x1.compactMap { Int($0) }
print(s1)

let x2: [Int?] = [5, nil, 55, nil, 555, nil, 5555]
let s2 = x2.compactMap { $0 }
print(s2)


// 7. Написать 2 примера с .sort

var k1 = [-12, 45, 568, -1334, 33555]
k1.sort(by: <)
print(k1)

var k2 = [-12, 45, 568, -1334, 33555]
k2.sort(by: >)
print(k2)

// 8. Написать 2 примера с .sorted

let l1 = [-12, 45, 568, -1334, 33555].sorted(by: <)
print(l1)

let l2 = [-12, 45, 568, -1334, 33555].sorted(by: >)
print(l2)
