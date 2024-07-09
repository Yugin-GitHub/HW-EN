import UIKit

var greeting = "Hello, playground"

// Задание 2
var a11: Int = 8
let a12: Double = 8.405060708090
var a13: Float = 5.5050
var CompanyName: String = "Apple Inc."
let TheWindowIsClosed: Bool = true
let TheWindowIsOpen: Bool = false


let minValue1 = UInt8.min
let maxValue1 = UInt8.max
let minValue2 = UInt16.min
let maxValue2 = UInt16.max
let minValue3 = UInt32.min
let maxValue3 = UInt32.max
let minValue4 = UInt64.min
let maxValue4 = UInt64.max

let minValue5 = Int8.min
let maxValue5 = Int8.max
let minValue6 = Int16.min
let maxValue6 = Int16.max
let minValue7 = Int32.min
let maxValue7 = Int32.max
let minValue8 = Int64.min
let maxValue8 = Int64.max

print("String length: \(CompanyName.count) characters")



// Задание 3
// Выражение 1
let int1: Int = 458
let float1: Float = Float(int1)

// Выражение 2
let float2: Float = 99.99
let int2: Int = Int(float2)

// Выражение 3
let int3: Int = 557788
let double3: Double = Double(int3)


// Выражение 4
let double4: Double = 7.45
let int4: Int = Int(double4)

// Выражение 5
let string5: String = "009"
let int5 = Int(string5)

// Выражение 6
let int6: Int = 99
let string6: String = String(int6)

// Выражение 7
let string7: String = "78.6"
let double7 = Double(string7)

// Выражение 8
let double8: Double = 3.55
let stringValue8: String = String("double8")



// Задание 4
// Выражение 1
var minusNine1: Double = -9.55
var two1: Int = 2
var six1: Int = 6
let sum1 = Int(minusNine1) * two1 - six1

// Выражение 2
var minusNine2: Int = -9
var two2: Int = 2
var six2: Double = 6.543
var tree2: Double = 3.14
let sum2 = six2 * Double(two2) + Double(minusNine2) / tree2

// Выражение 3
var two3: Int = 2
var six3: Double = 6.543
let sum3 = Int(six3) % two3


// Задание 5

var isNight = true
if isNight == false{
    print("Сейчас ночь")
}else{
    print("Сейчас день")
}


// Задание 6
let stroka = "Apple Inc.!"

var kopiaStroki = ""
for character in stroka {
    kopiaStroki.append(character)
}

print("Копия: \(kopiaStroki)")



// Задание 7
var numberArray = [13, 2, 20, 21, 76]
for sorting in numberArray {
if sorting % 2 == 0 {
    print ("\(sorting) четное число")
} else {
    print ("\(sorting) нечетное число")
}
}


// Задание 8
/* let day = 25

var dayDecade: String {
    if (day != 0) {
        print(1...11)
        dayDecade = "1-ая декада"
    } else {
        print(12...22)
        dayDecade = "2-ая декада"
    } else {
        print(23...31)
        dayDecade = "3-ая декада"
    } else {
        dayDecade = "unknown"
    }
}
*/
 
// Задание 9

var ValueCharacter = "bbppeeyy"
if ValueCharacter.first == "p" {
    print("Да, первая буква - b")
}else{
    print("Нет, первая буква не - b")
}


// Задание 10
let number1 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
let number2 = 1...9
for a in number1 {
    for b in number2 {
        let result = a * b
        print("\(a) * \(b) = \(result)")
    }
}

