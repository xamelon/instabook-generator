//
//  PostSettingsPanelViewController.swift
//  instabook-generator
//
//  Created by Stanislav Buldakov on 26/12/2019.
//  Copyright © 2019 Instabook. All rights reserved.
//

import UIKit
import SnapKit

final class PostSettingsPanelViewController: UIViewController, PostSettingsPanelViewInput, ModuleTransitionable {

    // MARK: - Properties
    
    var stackView: UIStackView!
    var output: PostSettingsPanelViewOutput?
    
    var closeButton: UIButton!
    var textButton: UIButton!

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buildView()
    }
    
    private func buildView() {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        
        textButton = UIButton()
        textButton.setTitle("T", for: .normal)
        textButton.setTitleColor(UIColor.white, for: .normal)
        stackView.addArrangedSubview(textButton)
        
        closeButton = UIButton()
        closeButton.setTitle("X", for: .normal)
        closeButton.setTitleColor(UIColor.white, for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
        stackView.addArrangedSubview(closeButton)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layer.cornerRadius = view.frame.size.height / 2
    }
    
    
    // MARK: - PostSettingsPanelViewInput
    @objc func closeButtonDidTap() {
        output?.close()
    }

}
