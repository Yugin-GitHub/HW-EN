import UIKit

var greeting = "Hello, playground"


/* Задание 1
 Создать enum с временами года. Написать функцию, которая будет принимать номер месяца (Int) и возвращать enum с временем года этого месяца.
 */

enum Seasons {
    case spring
    case summer
    case autumn
    case winter
}

func WhichSeason(with month: Int) -> Seasons? {
    switch month {
    case 3...5:
        return .spring
    case 6...8:
        return .summer
    case 9...11:
        return .autumn
    case 12,1,2:
        return .winter
    default:
        return nil
    }
}
WhichSeason(with: 6)

/* Задание 2
 Написать метод, который принимает variadic parameter String?. Метод возвращает количество nil объектов и печатает в консоль одну строку всех объединенных не nil объектов.
 */

func VariadicParamenr(ListPhrases: String?...) -> Int {
    var quantityNil: Int = 0
    var Phrases: String = ""
    for i in ListPhrases {
        if let i = i {
            Phrases.append(i)
        } else {
            quantityNil += 1
        }
    }
    print(Phrases)
    return quantityNil
}

VariadicParamenr(ListPhrases: "Apple ", nil, nil, "Inc.", nil, nil, "!", nil)

/* Задание 3
Конспект со всеми способами извлечения опционала
 */

/*
 1. Для безопасной распаковки опционального значения используется - if let
 */

var Apple1: String? = "Apple Inc.!"

if let safeString = Apple1 {
    print(safeString)
} else {
    print("Значение - nil")
}

var Apple2: String? = nil

if let safeString = Apple2 {
    print(safeString)
} else {
    print("Значение - nil")
}

/*
 2. Для раннего выхода из функции, если опционал nil используется - guard let
*/

func printString(_ Apple1: String?) {
    guard let safeString = Apple1 else {
        print("Значение - nil")
        return
    }
    print(safeString)
}

printString("Apple Inc.!")
printString(nil)



/*
 3. Использование !
 */

print(Apple1!)



/*
 4. Для предоставления значения по умолчанию, если опционал nil используется - ??
 */

Apple2 = nil
let safeString = Apple2 ?? "Apple"
print(safeString)



/*
 5. Для проверки и извлечения значений из опционала используется - switch
 */

Apple1 = "Apple Inc.!"
switch Apple1 {
case .some(let value):
    print(value)
case .none:
    print("Значение - nil")
}
