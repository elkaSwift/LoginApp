//
//  User.swift
//  LoginApp
//
//  Created by Елисей Мищенко on 22.12.2021.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person

    static func getUserData() -> User {
        User(
            login: "Elisei",
            password: "12345",
            person: Person.getPerson()
        )
    }
}


struct Person {
    let name: String
    let surname: String
    let image: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(name: "Elisei", surname: "Mishchenko", image: "SwiftImage")
    }
}


