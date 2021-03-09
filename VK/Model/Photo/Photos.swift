//
//  Photos.swift
//  VK
//
//  Created by Karahanyan Levon on 09.03.2021.
//

import Foundation

class PhotosClass: Decodable {
    var userId = 0
    var urlImage = ""
    var imageNames = [""]
    
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
        let firstUrlValue = try urlValues.nestedContainer(keyedBy: UrlKeys.self)
        self.urlImage = try firstUrlValue.decode(String.self, forKey: .url)
        self.imageNames.append(urlImage)
    }
}
