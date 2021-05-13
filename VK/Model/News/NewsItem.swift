//
//  NewsItem.swift
//  VK
//
//  Created by Karahanyan Levon on 01.05.2021.
//

import UIKit
import RealmSwift

class NewsItem: Object, Decodable {
    
    @objc dynamic var text: String? = ""
    var attachments: [NewsAttachment]? = []
    
    enum CodingKeys: String, CodingKey {
        case text
        case attachments
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try values.decodeIfPresent(String.self, forKey: .text)
        self.attachments = try values.decodeIfPresent([NewsAttachment].self, forKey: .attachments)
    }
}
