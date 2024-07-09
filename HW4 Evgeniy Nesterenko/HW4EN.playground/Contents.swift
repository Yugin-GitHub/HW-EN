import UIKit

// Задание 1
func HiWorld (W: String) -> String {
let Sochetanie = "Hello, " + W + "!"
return Sochetanie
 }

print(HiWorld (W: "world"))


func HiName (Name: String) -> String {
let greetinName = "Hello! " + Name
return greetinName
 }

print(HiName (Name: "Misha"))


// Задание 2
 
func sumValue(Value1: String, Value2: String) -> Int {
    return Value1.count + Value2.count
 }
sumValue(Value1: "Apple", Value2: "Inc.")


// Задание 3

func Variables2 (with Value3: Float) {
let SquareOfNumbers = Value3 * Value3
print(SquareOfNumbers)
 }
Variables2(with: 3.162277)

// Задание 4
/* var num1: Int = 9
var num2: Int = 8

func sumNum1 (num1: Int, num2: Int) -> Int {
    return num1 + num2

func sumNum1 (num1: Int, num2: Int) -> Int
    return num1 + num2

func sumNum1 (num1: Int, num2: Int) -> Int
    return num1 + num2

func sumNum1 (num1: Int, num2: Int) -> Int
    return num1 + num2
}
 */

// Задание 5
func AreaOfCircle (Radius: Int, pi: Float = 3.14) -> Double {
let square = Float (Radius) * pi
    return Double(square)
 }

print(AreaOfCircle(Radius: 23))

// Задание 6

func TimesOfDay (isDay: Bool) -> String {
    let DayOrNight: String = isDay ? "Сейчас День" : " Сейчас Ночь"
    return DayOrNight
}
TimesOfDay (isDay: false)


// Задание 7 – Не осилил пока что

// Задание 8
enum TimeOfTheYear: String {
    case spring = "Весна"
    case summer = "Лето"
    case autumn = "Осень"
    case winter = "Зима"

}

func WhichSeason(with month: Int) -> String {
    switch month {
    case 3...5:
        return TimeOfTheYear.spring.rawValue
    case 6...8:
        return TimeOfTheYear.summer.rawValue
    case 9...11:
        return TimeOfTheYear.autumn.rawValue
    case 12,1,2:
        return TimeOfTheYear.winter.rawValue
    default:
        return "Error"
    }
}
WhichSeason(with: 6)


// Задание 9*
func Factorial(value: Int) -> Int {
    if value == 0 {
        return 1
    } else {
        return value * Factorial(value: value - 1)
    }
}
Factorial(value: 9)


