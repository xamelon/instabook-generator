//
//  SinglePostViewController.swift
//  instabook-generator
//
//  Created by Stanislav Buldakov on 24/12/2019.
//  Copyright © 2019 Instabook. All rights reserved.
//

import UIKit
import SnapKit
import Nuke

final class SinglePostViewController: UIViewController, SinglePostViewInput, ModuleTransitionable, PostView {

    // MARK: - Properties
    var dateLabel: UILabel!
    var likesLabel: UILabel!
    var imageView: UIImageView!
    var textLabel: UILabel!
    var settingsPanel: PostSettingsPanelViewController!
    
    var output: SinglePostViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buildView()
        
        output?.viewDidLoad()
    }
    
    func buildView() {
        self.view.backgroundColor = UIColor.white
        
        let backView = UIView()
        backView.backgroundColor = UIColor.white
        backView.layer.shadowColor = UIColor.gray.cgColor
        backView.layer.shadowOpacity = 0.5
        backView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        backView.layer.shadowRadius = 4.0
        backView.layer.masksToBounds = false
        view.addSubview(backView)
        backView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(Constants.Full.postWidth)
            make.height.equalTo(Constants.Full.postWidth)
        }
        
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.snp.makeConstraints { [unowned self] (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(12.0)
            make.trailing.equalToSuperview().offset(-12.0)
            make.height.equalTo(self.imageView.snp.width)
        }
        
        dateLabel = UILabel()
        dateLabel.font = UIFont.lightFont(size: 12.0)
        dateLabel.textColor = UIColor.lightGray
        view.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { [unowned self] (make) in
            make.bottom.equalTo(self.imageView.snp.top).offset(-5.0)
            make.leading.equalTo(self.imageView)
        }
        
        likesLabel = UILabel()
        likesLabel.font = UIFont.lightFont(size: 12.0)
        likesLabel.textColor = UIColor.systemGray
        view.addSubview(likesLabel)
        likesLabel.snp.makeConstraints { [unowned self] (make) in
            make.trailing.equalTo(self.imageView)
            make.bottom.equalTo(self.dateLabel)
        }
        
        textLabel = UILabel()
        textLabel.font = UIFont.lightFont(size: 12.0)
        textLabel.minimumScaleFactor = 0.5
        textLabel.textColor = UIColor.systemGray
        view.addSubview(textLabel)
        textLabel.snp.makeConstraints { [unowned self] (make) in
            make.top.equalTo(self.imageView.snp.bottom).offset(5.0)
            make.leading.equalTo(self.imageView)
            make.trailing.equalTo(self.imageView)
        }
        
        if let postSettingsPanel = self.output?.getPostPanelViewController() {
            addChild(postSettingsPanel)
            view.addSubview(postSettingsPanel.view)
            postSettingsPanel.view.snp.makeConstraints { make in
                make.bottom.equalToSuperview().offset(-(self.view.frame.size.height - Constants.Full.postWidth) / 4)
                make.leading.equalToSuperview().offset(12.0)
                make.trailing.equalToSuperview().offset(-12.0)
                make.height.equalTo(44.0)
            }
        }
    }

    // MARK: - SinglePostViewInput
    func configure() {
        
    }
    
    func setLikesLabel(_ likes: String) {
        self.likesLabel.text = likes
    }
    
    func setTextLabel(_ text: String) {
        self.textLabel.text = text
    }
    
    func setDateLabel(_ string: String) {
        self.dateLabel.text = string
    }
    
    func setImageURL(_ url: URL?) {
        guard let url = url else {
            return
        }
        Nuke.loadImage(with: url, into: self.imageView)
    }
    
    // MARK: - PostView
    var textIsHidden: Bool {
        set {
            self.textLabel.isHidden = newValue
        }
        get {
            return self.textLabel.isHidden
        }
    }
    
    var likesIsHidden: Bool {
        set {
            self.likesLabel.isHidden = newValue
        }
        get {
            return self.likesLabel.isHidden
        }
    }
    
    var dateIsHidden: Bool {
        set {
            self.dateLabel.isHidden = newValue
        }
        get {
            return self.dateLabel.isHidden
        }
    }

}
