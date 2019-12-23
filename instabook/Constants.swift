//
//  Constants.swift
//  instabook
//
//  Created by Body Block on 23/12/2019.
//  Copyright © 2019 Stanislav Buldakov. All rights reserved.
//

import UIKit

struct Constants {
    
    struct Preview {
        
        static let postWidth = UIScreen.main.bounds.size.width - 40
        static let imageWidth = Constants.Preview.postWidth * 0.6
        
        static let font = UIFont.lightFont(size: 7.0)
    }
    
    struct Full {
        static let imageWidth = UIScreen.main.bounds.size.width - 24
        static let postWidth = Constants.Full.imageWidth / 0.6
    }
    
}
