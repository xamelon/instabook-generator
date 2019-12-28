//
//  Constants.swift
//  instabook
//
//  Created by Body Block on 23/12/2019.
//  Copyright © 2019 Stanislav Buldakov. All rights reserved.
//

import UIKit

struct Constants {
    
    struct Common {
        struct Images {
            static let close = UIImage(named: "close")!
        }
    }
    
    struct Preview {
        
        static let postWidth = UIScreen.main.bounds.size.width - 40
        static let imageWidth = Constants.Preview.postWidth * 0.6
        
        static let font = UIFont.lightFont(size: 7.0)
    }
    
    struct Full {
        static let imageWidth = UIScreen.main.bounds.size.width - 24
        static let postWidth = Constants.Full.imageWidth / 0.6
        
        struct Images {
            static let likesEnable = UIImage(named: "likes-enable")!
            static let calendarEnable = UIImage(named: "calendar-enable")!
            static let textEnable = UIImage(named: "text-enable")!
            static let textDisable = UIImage(named: "text-disable")!
            static let calendarDisable = UIImage(named: "calendar-disable")!
            static let likesDisable = UIImage(named: "likes-disable")!
        }
    }
    
}
