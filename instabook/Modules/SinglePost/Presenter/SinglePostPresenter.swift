//
//  SinglePostPresenter.swift
//  instabook-generator
//
//  Created by Stanislav Buldakov on 24/12/2019.
//  Copyright © 2019 Instabook. All rights reserved.
//

import Foundation

final class SinglePostPresenter: SinglePostViewOutput, SinglePostModuleInput {

    // MARK: - Properties

    weak var view: SinglePostViewInput?
    var router: SinglePostRouterInput?
    var output: SinglePostModuleOutput?
    
    var post: Post!
    // MARK: - SinglePostViewOutput
    
    func viewDidLoad() {
        
        
        self.view?.setLikesLabel(String.string(withLikes: post.likes))
        self.view?.setImageURL(post.imageURL)
        self.view?.setTextLabel(post.text)
        let date = Date(timeIntervalSince1970: post.timestamp)
        self.view?.setDateLabel(date.formattedDate())
    }
    
    // MARK: - SinglePostModuleInput

}
