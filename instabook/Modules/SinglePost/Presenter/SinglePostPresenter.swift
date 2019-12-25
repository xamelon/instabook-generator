//
//  SinglePostPresenter.swift
//  instabook-generator
//
//  Created by Stanislav Buldakov on 24/12/2019.
//  Copyright © 2019 Instabook. All rights reserved.
//

import Foundation
import UIKit

final class SinglePostPresenter: SinglePostViewOutput, SinglePostModuleInput, PostSettingsPanelModuleOutput {

    // MARK: - Properties

    weak var view: SinglePostViewInput?
    var router: SinglePostRouterInput?
    var output: SinglePostModuleOutput?
    
    private var postPanelViewController: PostSettingsPanelViewController!
    
    var post: Post!
    // MARK: - SinglePostViewOutput
    
    func viewDidLoad() {
        
        
        self.view?.setLikesLabel(String.string(withLikes: post.likes))
        self.view?.setImageURL(post.imageURL)
        self.view?.setTextLabel(post.text)
        let date = Date(timeIntervalSince1970: post.timestamp)
        self.view?.setDateLabel(date.formattedDate())
    }
    
    func getPostPanelViewController() -> UIViewController {
        self.postPanelViewController = ServiceLocator.getPostPanelSettings(withPostPanelSettingsOutput: self)
        return self.postPanelViewController
    }
    
    // MARK: - SinglePostModuleInput
    
    // MARK: - PostSettingsPanelModuleOutput
    func close() {
        router?.close()
    }
    

}
