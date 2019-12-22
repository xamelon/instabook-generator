//
//  UIFont+Extensions.swift
//  instabook
//
//  Created by Body Block on 04/12/2019.
//  Copyright © 2019 Stanislav Buldakov. All rights reserved.
//

import UIKit

extension UIFont {
    static func lightFont(size: CGFloat) -> UIFont {
        return UIFont(name: "MuseoSansCyrl-300", size: size)!
    }
    
    static func regularFont(size: CGFloat) -> UIFont {
        return UIFont(name: "MuseoSansCyrl-500", size: size)!
    }
}
