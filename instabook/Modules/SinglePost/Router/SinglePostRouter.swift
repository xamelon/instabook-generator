//
//  SinglePostRouter.swift
//  instabook-generator
//
//  Created by Stanislav Buldakov on 24/12/2019.
//  Copyright © 2019 Instabook. All rights reserved.
//

import UIKit

final class SinglePostRouter: SinglePostRouterInput {

	// MARK: - Properties

    weak var view: ModuleTransitionable?

	// MARK: - SinglePostRouterInput
    func close() {
        self.view?.dismissView(animated: true, completion: nil)
    }

}
