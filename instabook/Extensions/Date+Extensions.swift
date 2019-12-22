//
//  UIDate+Extensions.swift
//  instabook
//
//  Created by Body Block on 23/12/2019.
//  Copyright © 2019 Stanislav Buldakov. All rights reserved.
//

import UIKit

extension Date {
    func formattedDate() -> String {
        
        let df = DateFormatter()
        df.dateFormat = "dd MMMM yyyy"
        
        return df.string(from: self)
    }
}
