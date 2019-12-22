//
//  ApiClientMock.swift
//  instabook
//
//  Created by Body Block on 14/12/2019.
//  Copyright © 2019 Stanislav Buldakov. All rights reserved.
//

import Foundation

class ApiClientMock : ApiClient {
    
    func suggestUsername(withText text: String, success: (([String]) -> Void)) {
        success([
            "alina.pushkaryova",
            "stasbuldakov"
        ])
    }
    
    func getPhotos(ofUsername username: String, success: (([Post]) -> Void)) {
        let postsArray = [
            Post(timestamp: 123511.0,
                 likes: 12,
                 text: "Просто парочка постов",
                 imageURL: URL(string: "https://i.imgur.com/6pf04PP.jpg")!),
            Post(timestamp: 12344.0,
                 likes: 124,
                 text: "Такая красота на фотке",
                 imageURL: URL(string: "https://gramofon.ua/uploads/page/meta_img/98/2015-01-09_1420807104_4130896c2c7c45fddc57af3e9fa3b004.jpg")!),
            Post(timestamp: 5112334.0,
                 likes: 12,
                 text: "Просто парочка постов",
                 imageURL: URL(string: "https://gramofon.ua/uploads/page/meta_img/98/2015-01-09_1420807104_4130896c2c7c45fddc57af3e9fa3b004.jpg")!),
            Post(timestamp: 123511.0,
                 likes: 12,
                 text: "Просто парочка постов",
                 imageURL: URL(string: "https://gramofon.ua/uploads/page/meta_img/98/2015-01-09_1420807104_4130896c2c7c45fddc57af3e9fa3b004.jpg")!),
        ]
        
        success(postsArray)
    }
    
}
