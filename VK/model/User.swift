//
//  User.swift
//  VK
//
//  Created by Karahanyan Levon on 09.01.2021.
//

import Foundation
import UIKit

struct User {
    var firstName: String
    var lastName: String
    var image: UIImage
    var isBestFriend: Bool
}


var users = [
    User(firstName: "Spider", lastName: "Man", image: UIImage(named: "spiderMan")!, isBestFriend: false),
    User(firstName: "Iron", lastName: "Man", image: UIImage(named: "ironMan")!, isBestFriend: false),
    User(firstName: "Nikol", lastName: "Pashinyan", image: UIImage(named: "nikol")!, isBestFriend: false),
    User(firstName: "Kim", lastName: "Kardashyan", image: UIImage(named: "Kim")!, isBestFriend: false),
    User(firstName: "Serj", lastName: "Tankyan", image: UIImage(named: "serj")!, isBestFriend: false),
    User(firstName: "Daron", lastName: "Malakyan", image: UIImage(named: "daron")!, isBestFriend: false),
    User(firstName: "Alexis", lastName: "Ohanian", image: UIImage(named: "alexis")!, isBestFriend: false),
    User(firstName: "Emma", lastName: "Watson", image: UIImage(named: "emma-1")!, isBestFriend: false),
    User(firstName: "Arnold", lastName: "Schwarzenegger", image: UIImage(named: "arnold")!, isBestFriend: false),
    User(firstName: "Sylvester", lastName: "Stallone", image: UIImage(named: "sly")!, isBestFriend: false)
]

