//
//  PageCollectionViewCell.swift
//  instabook
//
//  Created by Body Block on 23/12/2019.
//  Copyright © 2019 Stanislav Buldakov. All rights reserved.
//

import UIKit
import SnapKit

class PageCollectionViewCell: UICollectionViewCell, PostView {

    var dateLabel: UILabel
    var likesLabel: UILabel
    var imageView: UIImageView
    var textView: UILabel
    
    override init(frame: CGRect) {
        dateLabel = UILabel()
        likesLabel = UILabel()
        imageView = UIImageView()
        textView = UILabel()
        
        super.init(frame: frame)
        self.buildView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildView() {
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 2.0
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.2
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        imageView.snp.makeConstraints { [unowned self] (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            make.width.equalTo(self.imageView.snp.height)
            make.height.equalTo(Constants.Preview.imageWidth)
        }
        
        
        dateLabel.text = "12 декабря 2019"
        dateLabel.textColor = UIColor.systemGray
        dateLabel.font = Constants.Preview.font
        self.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { [unowned self] (make) in
            make.bottom.equalTo(self.imageView.snp.top).offset(-5.0)
            make.leading.equalTo(self.imageView)
        }
        
        likesLabel.text = "❤️ 54"
        likesLabel.textColor = UIColor.systemGray
        likesLabel.font = Constants.Preview.font
        self.addSubview(likesLabel)
        likesLabel.snp.makeConstraints { [unowned self] (make) in
            make.centerY.equalTo(dateLabel)
            make.trailing.equalTo(self.imageView)
        }
        
        textView.textColor = UIColor.systemGray
        textView.font = Constants.Preview.font
        self.addSubview(textView)
        textView.snp.makeConstraints { [unowned self] (make) in
            make.top.equalTo(self.imageView.snp.bottom).offset(5.0)
            make.leading.equalTo(self.imageView)
            make.trailing.equalTo(self.imageView)
            make.bottom.lessThanOrEqualToSuperview().offset(-5.0)
        }
    }
    
    static func reuseIdentifier() -> String {
        return "PageCollectionViewCell"
    }
    
    // MARK: - PostView
    var textIsHidden: Bool {
        set {
            self.textView.isHidden = newValue
        }
        get {
            return self.textView.isHidden
        }
    }
    
    var likesIsHidden: Bool {
        set {
            self.likesLabel.isHidden = newValue
        }
        get {
            return self.textView.isHidden
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
