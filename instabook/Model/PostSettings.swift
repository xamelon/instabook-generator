//
//  PostSettings.swift
//  instabook
//
//  Created by Body Block on 28/12/2019.
//  Copyright © 2019 Stanislav Buldakov. All rights reserved.
//

import UIKit

class PostSettings {
    
    var dateIsHidden: Bool
    var likesIsHidden: Bool
    var textIsHidden: Bool
    // TODO: font size
    // TODO: font name
    
    init(dateIsHidden: Bool,
         likesIsHidden: Bool,
         textIsHidden: Bool) {
        self.dateIsHidden = dateIsHidden
        self.likesIsHidden = likesIsHidden
        self.textIsHidden = likesIsHidden
    }

    static func defaultSettings() -> PostSettings {
        return PostSettings(dateIsHidden: false,
                            likesIsHidden: false,
                            textIsHidden: false)
    }
    
}
