//
//  ApiClient.swift
//  instabook
//
//  Created by Body Block on 14/12/2019.
//  Copyright © 2019 Stanislav Buldakov. All rights reserved.
//

protocol ApiClient {
    func suggestUsername(withText text: String, success: (([String]) -> Void))
    func getPhotos(ofUsername username: String, success: (([Post]) -> Void))
}

class ApiClientService : ApiClient {
    
    func suggestUsername(withText text: String, success: (([String]) -> Void)) {
        
    }
    
    func getPhotos(ofUsername username: String, success: (([Post]) -> Void)) {
        
    }
}
