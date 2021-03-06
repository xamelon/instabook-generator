//
//  CarouselPresenter.swift
//  instabook
//
//  Created by Body Block on 14/12/2019.
//  Copyright © 2019 Stanislav Buldakov. All rights reserved.
//

import UIKit

class CarouselPresenter: CarouselViewOutput {
    
    var model: CarouselModelInput!
    weak var view: CarouselViewInput!
    var posts: [Post] = []
    var router: CarouselRouterInput!
    
    
    private func getPosts() {
        
        let success: (([Post]) -> Void) = { [unowned self] posts in
            self.posts = posts
            print("Posts: \(posts)")
            self.view.configure()
        }
        
        self.model.getPosts(success: success)
    }
    
    // MARK: - CarouselViewOutput
    
    func viewDidLoad() {
        self.getPosts()
        
    }
    
    func getPost(atIndex index: Int) -> Post? {
        if index >= posts.count || index < 0 {
            return nil
        }
        
        return posts[index]
    }
    
    func getPostsCount() -> Int {
        return posts.count
    }
    
    func showPost(atIndex index: Int) {
        self.router.openSinglePost(self.posts[index])
    }
    
}
