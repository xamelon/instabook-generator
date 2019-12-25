//
//  PostSettingsPanelPresenter.swift
//  instabook-generator
//
//  Created by Stanislav Buldakov on 26/12/2019.
//  Copyright © 2019 Instabook. All rights reserved.
//

final class PostSettingsPanelPresenter: PostSettingsPanelViewOutput, PostSettingsPanelModuleInput {

    // MARK: - Properties

    weak var view: PostSettingsPanelViewInput?
    var output: PostSettingsPanelModuleOutput?
    
    // MARK: - PostSettingsPanelViewOutput
    func close() {
        output?.close()
    }
    

    // MARK: - PostSettingsPanelModuleInput

}
