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
    weak var settingsViewInput: PostSettingsPanelViewInput?
    
    private var postPanelViewController: PostSettingsPanelViewController!
    
    init() {
        self.postPanelViewController = ServiceLocator.getPostPanelSettings(withPostPanelSettingsOutput: self)
        self.settingsViewInput = postPanelViewController
    }
    
    var post: Post!
    // MARK: - SinglePostViewOutput
    
    func viewDidLoad() {
        
        
        self.view?.setLikesLabel(String.string(withLikes: post.likes))
        self.view?.setImageURL(post.imageURL)
        self.view?.setTextLabel(post.text)
        let date = Date(timeIntervalSince1970: post.timestamp)
        self.view?.setDateLabel(date.formattedDate())
        if var postView = view as? PostView {
            postView.applyPostSettings(post.postSettings)
            settingsViewInput?.setTextIsHidden(post.postSettings.textIsHidden)
            settingsViewInput?.setDateIsHidden(post.postSettings.dateIsHidden)
            settingsViewInput?.setLikesIsHidden(post.postSettings.likesIsHidden)
        }
        
    }
    
    func getPostPanelViewController() -> UIViewController {
        
        return self.postPanelViewController
    }
    
    // MARK: - SinglePostModuleInput
    
    // MARK: - PostSettingsPanelModuleOutput
    func close() {
        router?.close()
    }
    
    func likesSettingChange() {
        self.post.postSettings.likesIsHidden = !self.post.postSettings.likesIsHidden
        self.reload()
    }
    
    func calendarSettingChange() {
        self.post.postSettings.dateIsHidden = !self.post.postSettings.dateIsHidden
        self.reload()
    }
    
    func textSettingChange() {
        self.post.postSettings.textIsHidden = !self.post.postSettings.textIsHidden
        self.reload()
    }
    
    private func reload() {
        if var postView = view as? PostView {
            postView.applyPostSettings(post.postSettings)
        }
        self.settingsViewInput?.setDateIsHidden(post.postSettings.dateIsHidden)
        self.settingsViewInput?.setLikesIsHidden(post.postSettings.likesIsHidden)
        self.settingsViewInput?.setTextIsHidden(post.postSettings.textIsHidden)
    }
    

}
