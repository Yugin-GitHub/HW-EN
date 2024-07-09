import UIKit

var greeting = "Hello, playground"

class Person {
    let name: String
    let surname: String
    let age: Int
    init(
        name: String,
        surname: String,
        age: Int
    ) {
        self.age = age
        self.name = name
        self.surname = surname
    }
}


enum Lessons: String {
    case maths
    case history
    case geography
    case english
    case music
    case economics
}


final class Student: Person {
    private let schoolClassNumber: Int
    private let academicPerformance: [(Lessons, Double)]
    init(
        name: String,
        surname: String,
        age: Int,
        schoolClassNumber: Int,
        academicPerformance: [(Lessons, Double)] = [ ]
    ) {
        self.schoolClassNumber = schoolClassNumber
        self.academicPerformance = academicPerformance
        super.init(
            name: name,
            surname: surname,
            age: age
        )
    }

    func studentDetails () {
        print("Person: \(name), \(surname), \(age), Student: \(schoolClassNumber), \(academicPerformance)")
    }
}



final class Director: Person {
    let experience: Int
    let rating: Double

    init(
        name: String,
        surname: String,
        age: Int,
        experience: Int,
        rating: Double
    ) {
        self.experience = experience
        self.rating = rating
        super.init(
            name: name,
            surname: surname,
            age: age
        )
    }
}



struct schoolAddress {
    let x: Double
    let y: Double
    let street: String
}



struct School {
    let name: String
    let address: schoolAddress
    let director: Director

    init(
        name: String,
        address: schoolAddress,
        director: Director
    ) {
        self.name = name
        self.address = address
        self.director = director

    }

    func schoolDetails () {
        print("School: \(name), Address: \(address.street), \nCoordinates: (\(address.x), \(address.y))")
  
        print("Director: \(director.surname) \(director.name), Experience: \(director.experience), Rating: \(director.rating)")
            }
}


//Примеры с конкретными данными
let address = schoolAddress(x: 23565.123, y: 76853.32456, street: "One Apple Park Way, Cupertino, California, USA")

let schoolDirector = Director(name: "Tim", surname: "Cook", age: 63, experience: 26, rating: 9.9)


let studentJeff = Student(
    name: "Jeff",
    surname: "Williams",
    age: 61, schoolClassNumber: 11,
    academicPerformance: [
        (Lessons.economics, 4.99),
        (Lessons.english, 5.00)
    ]
)
let studentLuca = Student(
    name: "Luca",
    surname: "Maestri",
    age: 60, schoolClassNumber: 10,
    academicPerformance: [
        (Lessons.economics, 4.94),
        (Lessons.maths, 4.87)
    ]
)

let SchoolNameAddressDirector = School(
    name: "Apple Inc.!",
    address: address,
    director: schoolDirector
    
)

