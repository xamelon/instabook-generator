//
//  SinglePostViewOutput.swift
//  instabook-generator
//
//  Created by Stanislav Buldakov on 24/12/2019.
//  Copyright © 2019 Instabook. All rights reserved.
//

import UIKit

protocol SinglePostViewOutput {

    func viewDidLoad()
    
    func getPostPanelViewController() -> UIViewController
    
}
