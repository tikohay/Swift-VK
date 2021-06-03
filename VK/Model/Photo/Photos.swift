//
//  Photos.swift
//  VK
//
//  Created by Karahanyan Levon on 09.03.2021.
//

import Foundation
import RealmSwift

class PhotosClass: Object, Decodable {
    @objc dynamic var userId = 0
    @objc dynamic var urlImage = ""
    var imageNames = List<String>()
    
    enum CodingKeys: String, CodingKey {
        case userId = "owner_id"
        case sizes
    }
    
    enum UrlKeys: String, CodingKey {
        case url
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try values.decode(Int.self, forKey: .userId)
        var urlValues = try values.nestedUnkeyedContainer(forKey: .sizes)
        var lastUrlValue = try urlValues.nestedContainer(keyedBy: UrlKeys.self)
        
        while !urlValues.isAtEnd {
            lastUrlValue = try urlValues.nestedContainer(keyedBy: UrlKeys.self)
        }
        
        self.urlImage = try lastUrlValue.decode(String.self, forKey: .url)
        self.imageNames.append(urlImage)
    }
}
