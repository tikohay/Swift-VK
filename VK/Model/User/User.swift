//
//  User.swift
//  VK
//
//  Created by Karahanyan Levon on 09.01.2021.
//

import UIKit

class UserClass: Decodable {
    var firstName = ""
    var lastName = ""
    var avatarName = ""
    var userId = 0
    var isBestFriend = false
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case avatarName = "photo_200_orig"
        case userId = "id"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()

        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.firstName = try values.decode(String.self, forKey: .firstName)
        self.lastName = try values.decode(String.self, forKey: .lastName)
        self.avatarName = try values.decode(String.self, forKey: .avatarName)
        self.userId = try values.decode(Int.self, forKey: .userId)
    }
}
