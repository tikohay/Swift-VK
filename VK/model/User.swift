//
//  User.swift
//  VK
//
//  Created by Karahanyan Levon on 09.01.2021.
//

import UIKit

struct User {
    var firstName: String
    var lastName: String
    var avatar: UIImage?
    var isBestFriend: Bool
    var images: [UIImage?]
}

var users = [
    User(firstName: "Spider",
         lastName: "Man",
         avatar: UIImage(named: "spiderMan"),
         isBestFriend: false,
         images: [
            UIImage(named: "spider1"),
            UIImage(named: "spider2")
         ]),
    
    User(firstName: "Iron",
         lastName: "Man",
         avatar: UIImage(named: "ironMan"),
         isBestFriend: false,
         images: [
            UIImage(named: "iron1"),
            UIImage(named: "iron2")
         ]),
    
    User(firstName: "Nikol",
         lastName: "Pashinyan",
         avatar: UIImage(named: "nikol"),
         isBestFriend: false,
         images:[
            UIImage(named: "nikol1"),
            UIImage(named: "nikol2")
         ]),
    
    User(firstName: "Kim",
         lastName: "Kardashyan",
         avatar: UIImage(named: "Kim"),
         isBestFriend: false,
         images: [
            UIImage(named: "kim1"),
            UIImage(named: "kim2")
         ]),
    
    User(firstName: "Serj",
         lastName: "Tankyan",
         avatar: UIImage(named: "serj"),
         isBestFriend: false,
         images: [
            UIImage(named: "serj1"),
            UIImage(named: "serj2")
         ]),
    
    User(firstName: "Daron",
         lastName: "Malakyan",
         avatar: UIImage(named: "daron"),
         isBestFriend: false,
         images: [
            UIImage(named: "daron1"),
            UIImage(named: "daron2")
        ]),
    
    User(firstName: "Alexis",
         lastName: "Ohanian",
         avatar: UIImage(named: "alexis"),
         isBestFriend: false,
         images: [
            UIImage(named: "alexis1"),
            UIImage(named: "alexis2")
         ]),
    
    User(firstName: "Emma",
         lastName: "Watson",
         avatar: UIImage(named: "emma-1"),
         isBestFriend: false,
         images: [
            UIImage(named: "emma1"),
            UIImage(named: "emma2")
         ]),
    
    User(firstName: "Arnold",
         lastName: "Schwarzenegger",
         avatar: UIImage(named: "arnold"),
         isBestFriend: false,
         images: [
            UIImage(named: "arnold1"),
            UIImage(named: "arnold2")
         ]),
    
    User(firstName: "Sylvester",
         lastName: "Stallone",
         avatar: UIImage(named: "sly"),
         isBestFriend: false,
         images: [
            UIImage(named: "sly1"),
            UIImage(named: "sly2")
         ])
]

