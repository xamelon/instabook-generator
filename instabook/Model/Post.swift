//
//  PageModel.swift
//  instabook
//
//  Created by Body Block on 03/12/2019.
//  Copyright © 2019 Stanislav Buldakov. All rights reserved.
//

import UIKit

struct Post {
    
    let timestamp: TimeInterval
    let likes: Int
    let text: String
    let imageURL: URL?
    let postSettings: PostSettings = PostSettings.defaultSettings()
    
    enum CodingKeys: String, CodingKey {
        case timestamp = "Date"
        case likes = "Likes"
        case text = "Text"
        case imageURL = "ImageURL"
    }
}

extension Post: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        timestamp = try container.decode(TimeInterval.self, forKey: CodingKeys.timestamp)
        likes = try container.decode(Int.self, forKey: CodingKeys.likes)
        text = try container.decode(String.self, forKey: CodingKeys.text)
        let stringURL = try container.decode(String.self, forKey: CodingKeys.imageURL)
        imageURL = URL(string: stringURL)
    }
    
}
