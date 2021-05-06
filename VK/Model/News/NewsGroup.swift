//
//  News1.swift
//  VK
//
//  Created by Karahanyan Levon on 01.05.2021.
//

import UIKit
import RealmSwift

class NewsGroup: Object, Decodable {
    
    @objc dynamic var name: String = ""
    @objc dynamic var image: String = ""
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case image = "photo_100"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try values.decode(String.self, forKey: .name)
        self.image = try values.decode(String.self, forKey: .image)
    }
}
