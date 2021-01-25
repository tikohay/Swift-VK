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
    var avatar: String
    var isBestFriend: Bool
    var images: [String]
}

var users = [
    User(firstName: "Spider",
         lastName: "Man",
         avatar: "spiderMan",
         isBestFriend: false,
         images: [
            "spider1",
            "spider2"
         ]),
    
    User(firstName: "Iron",
         lastName: "Man",
         avatar: "ironMan",
         isBestFriend: false,
         images: [
            "iron1",
            "iron2"
         ]),
    
    User(firstName: "Nikol",
         lastName: "Pashinyan",
         avatar: "nikol",
         isBestFriend: false,
         images:[
            "nikol1",
            "nikol2"
         ]),
    
    User(firstName: "Kim",
         lastName: "Kardashyan",
         avatar: "Kim",
         isBestFriend: false,
         images: [
            "kim1",
            "kim2"
         ]),
    
    User(firstName: "Serj",
         lastName: "Tankyan",
         avatar: "serj",
         isBestFriend: false,
         images: [
            "serj1",
            "serj2"
         ]),
    
    User(firstName: "Daron",
         lastName: "Malakyan",
         avatar: "daron",
         isBestFriend: false,
         images: [
            "daron1",
            "daron2"
        ]),
    
    User(firstName: "Alexis",
         lastName: "Ohanian",
         avatar: "alexis",
         isBestFriend: false,
         images: [
            "alexis1",
            "alexis2"
         ]),
    
    User(firstName: "Emma",
         lastName: "Watson",
         avatar: "emma-1",
         isBestFriend: false,
         images: [
            "emma1",
            "emma2"
         ]),
    
    User(firstName: "Arnold",
         lastName: "Schwarzenegger",
         avatar: "arnold",
         isBestFriend: false,
         images: [
            "arnold1",
            "arnold2"
         ]),
    
    User(firstName: "Sylvester",
         lastName: "Stallone",
         avatar: "sly",
         isBestFriend: false,
         images: [
            "sly1",
            "sly2"
         ])
]

