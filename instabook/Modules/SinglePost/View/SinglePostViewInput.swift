//
//  SinglePostViewInput.swift
//  instabook-generator
//
//  Created by Stanislav Buldakov on 24/12/2019.
//  Copyright © 2019 Instabook. All rights reserved.
//

import Foundation

protocol SinglePostViewInput: class {
        
    func setImageURL(_ url: URL?)
    func setDateLabel(_ string: String)
    func setLikesLabel(_ likes: String)
    func setTextLabel(_ text: String)
    
}
