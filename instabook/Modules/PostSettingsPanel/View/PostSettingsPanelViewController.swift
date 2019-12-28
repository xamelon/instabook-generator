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
    var dateButton: UIButton!
    var likesButton: UIButton!

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
        textButton.setImage(Constants.Full.Images.textDisable, for: .normal)
        textButton.addTarget(self, action: #selector(textButtonDidTap), for: .touchUpInside)
        stackView.addArrangedSubview(textButton)
        
        likesButton = UIButton()
        likesButton.setImage(Constants.Full.Images.likesDisable, for: .normal)
        likesButton.addTarget(self, action: #selector(likesButtonDidTap), for: .touchUpInside)
        stackView.addArrangedSubview(likesButton)
        
        dateButton = UIButton()
        dateButton.setImage(Constants.Full.Images.calendarDisable, for: .normal)
        dateButton.addTarget(self, action: #selector(calendarButtonDidTap), for: .touchUpInside)
        stackView.addArrangedSubview(dateButton)
        
        closeButton = UIButton()
        closeButton.setImage(Constants.Common.Images.close, for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
        stackView.addArrangedSubview(closeButton)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layer.cornerRadius = view.frame.size.height / 2
    }
    
    
    // MARK: - Selectors
    @objc func closeButtonDidTap() {
        output?.close()
    }
    
    @objc func textButtonDidTap() {
        self.output?.textButtonDidTap()
    }
    
    @objc func likesButtonDidTap() {
        self.output?.likesButtonDidTap()
    }
    
    @objc func calendarButtonDidTap() {
        self.output?.calendarButtonDidTap()
    }
    
    // MARK: - PostSettingsPanelViewInput
    func setDateIsHidden(_ isHidden: Bool) {
        if isHidden {
            self.dateButton.setImage(Constants.Full.Images.calendarEnable, for: .normal)
        } else {
            self.dateButton.setImage(Constants.Full.Images.calendarDisable, for: .normal)
        }
    }
    
    func setLikesIsHidden(_ isHidden: Bool) {
        if isHidden {
            self.likesButton.setImage(Constants.Full.Images.likesEnable, for: .normal)
        } else {
            self.likesButton.setImage(Constants.Full.Images.likesDisable, for: .normal)
        }
    }
    
    func setTextIsHidden(_ isHidden: Bool) {
        if isHidden {
            self.textButton.setImage(Constants.Full.Images.textEnable, for: .normal)
        } else {
            self.textButton.setImage(Constants.Full.Images.textDisable, for: .normal)
        }
    }
    

}
