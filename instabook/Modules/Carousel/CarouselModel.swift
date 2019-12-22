//
//  CarouselModel.swift
//  instabook
//
//  Created by Body Block on 14/12/2019.
//  Copyright © 2019 Stanislav Buldakov. All rights reserved.
//

import UIKit

protocol CarouselModelInput {
    func getPosts(success: (([Post]) -> Void))
}

class CarouselModel: CarouselModelInput {
    
    let apiClient = ApiClientMock()
    
    func getPosts(success: (([Post]) -> Void)) {
        apiClient.getPhotos(ofUsername: "kiwilerun", success: success)
    }
    
}
