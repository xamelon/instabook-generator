//
//  PostView.swift
//  instabook
//
//  Created by Body Block on 28/12/2019.
//  Copyright © 2019 Stanislav Buldakov. All rights reserved.
//

protocol PostView {
    
    var textIsHidden: Bool { get set }
    var likesIsHidden: Bool { get set }
    var dateIsHidden: Bool { get set }
    
}

extension PostView {
    mutating func applyPostSettings(_ postSettings: PostSettings) {
        self.textIsHidden = postSettings.textIsHidden
        self.likesIsHidden = postSettings.likesIsHidden
        self.dateIsHidden = postSettings.dateIsHidden
    }
}
