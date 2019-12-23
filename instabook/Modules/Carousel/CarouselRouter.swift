//
//  CarouselRouter.swift
//  instabook
//
//  Created by Body Block on 24/12/2019.
//  Copyright © 2019 Stanislav Buldakov. All rights reserved.
//

import UIKit

protocol CarouselRouterInput {
    
    func openSinglePost(_ post: Post)
    
}

final class CarouselRouter: CarouselRouterInput {
    
    weak var view: ModuleTransitionable?
    
    func openSinglePost(_ post: Post) {
        let singlePost = ServiceLocator.getSinglePost(withPost: post)
        view?.presentModule(singlePost, animated: true, completion: nil)
    }
    
}
