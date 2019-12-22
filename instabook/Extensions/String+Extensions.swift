//
//  String+Extensions.swift
//  instabook
//
//  Created by Body Block on 04/12/2019.
//  Copyright © 2019 Stanislav Buldakov. All rights reserved.
//

import Foundation

extension String {
    static func string(withLikes likes: Int) -> String {
        String(format: "❤️ %d", likes)
    }
}
