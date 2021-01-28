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
    var avatarName: String
    var isBestFriend: Bool
    var imagesName: [String]
}

var users = [
    User(firstName: "Spider",
         lastName: "Man",
         avatarName: "spiderMan",
         isBestFriend: false,
         imagesName: [
            "spider1",
            "spider2"
         ]),
    
    User(firstName: "Iron",
         lastName: "Man",
         avatarName: "ironMan",
         isBestFriend: false,
         imagesName: [
            "iron1",
            "iron2"
         ]),
    
    User(firstName: "Nikol",
         lastName: "Pashinyan",
         avatarName: "nikol",
         isBestFriend: false,
         imagesName:[
            "nikol1",
            "nikol2"
         ]),
    
    User(firstName: "Kim",
         lastName: "Kardashyan",
         avatarName: "Kim",
         isBestFriend: false,
         imagesName: [
            "kim1",
            "kim2"
         ]),
    
    User(firstName: "Serj",
         lastName: "Tankyan",
         avatarName: "serj",
         isBestFriend: false,
         imagesName: [
            "serj1",
            "serj2"
         ]),
    
    User(firstName: "Daron",
         lastName: "Malakyan",
         avatarName: "daron",
         isBestFriend: false,
         imagesName: [
            "daron1",
            "daron2"
        ]),
    
    User(firstName: "Alexis",
         lastName: "Ohanian",
         avatarName: "alexis",
         isBestFriend: false,
         imagesName: [
            "alexis1",
            "alexis2"
         ]),
    
    User(firstName: "Emma",
         lastName: "Watson",
         avatarName: "emma-1",
         isBestFriend: false,
         imagesName: [
            "emma1",
            "emma2"
         ]),
    
    User(firstName: "Arnold",
         lastName: "Schwarzenegger",
         avatarName: "arnold",
         isBestFriend: false,
         imagesName: [
            "arnold1",
            "arnold2"
         ]),
    
    User(firstName: "Sylvester",
         lastName: "Stallone",
         avatarName: "sly",
         isBestFriend: false,
         imagesName: [
            "sly1",
            "sly2"
         ])
]

