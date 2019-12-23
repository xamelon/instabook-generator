//
//  SinglePostViewController.swift
//  instabook
//
//  Created by Body Block on 23/12/2019.
//  Copyright © 2019 Stanislav Buldakov. All rights reserved.
//

import UIKit
import SnapKit
import Nuke

class SinglePostViewController: UIViewController {

    var imageView: UIImageView!
    var dateLabel: UILabel!
    var likesLabel: UILabel!
    var textLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buildView()
    }
    
    func buildView() {
        
        self.imageView = UIImageView()
        self.imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(12.0)
            make.trailing.equalToSuperview().offset(-12.0)
            make.height.equalTo(imageView.snp.width)
        }
        
        dateLabel = UILabel()
        dateLabel.font = UIFont.regularFont(size: 12.0)
        dateLabel.textColor = UIColor.systemGray
        self.view.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(imageView.snp.bottom).offset(5.0)
            make.leading.equalTo(imageView)
        }
        
        likesLabel = UILabel()
        likesLabel.font = UIFont.regularFont(size: 12.0)
        likesLabel.textColor = UIColor.systemGray
        view.addSubview(likesLabel)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
