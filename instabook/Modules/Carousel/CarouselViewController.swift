//
//  CarouselViewController.swift
//  instabook
//
//  Created by Body Block on 14/12/2019.
//  Copyright © 2019 Stanislav Buldakov. All rights reserved.
//

import UIKit
import SnapKit
import CenteredCollectionView
import Nuke

protocol CarouselViewOutput: class {
    func viewDidLoad()
    func getPost(atIndex index: Int) -> Post?
    func getPostsCount() -> Int
    
    func showPost(atIndex index: Int)
}

protocol CarouselViewInput: class {
    
    func configure()
    
}

class CarouselViewController: UIViewController, CarouselViewInput, ModuleTransitionable {
    var collectionView: UICollectionView!
    var presenter: CarouselViewOutput!
    
    let postWidth = UIScreen.main.bounds.size.width - 40
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func buildView() {
        
    
        let centeredCollectionViewLayout = CenteredCollectionViewFlowLayout()
        centeredCollectionViewLayout.itemSize = CGSize(width: postWidth,
                                                       height: postWidth)
        centeredCollectionViewLayout.minimumLineSpacing = 10
        self.collectionView = UICollectionView(centeredCollectionViewFlowLayout: centeredCollectionViewLayout)
        self.collectionView.register(PageCollectionViewCell.self, forCellWithReuseIdentifier: PageCollectionViewCell.reuseIdentifier())
        self.collectionView.backgroundColor = UIColor.clear
        self.collectionView.dataSource = self
        self.collectionView.clipsToBounds = false
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        let deleteButton = UIButton()
        deleteButton.setTitle(NSLocalizedString("Delete", comment: ""), for: .normal)
        deleteButton.titleLabel!.font = UIFont.regularFont(size: 12.0)
        deleteButton.setTitleColor(UIColor.white, for: .normal)
        deleteButton.backgroundColor = UIColor.systemRed
        deleteButton.layer.cornerRadius = 10.0
        deleteButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5.0, bottom: 0.0, right: 5.0)
        self.view.addSubview(deleteButton)
        deleteButton.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-12.0)
            make.top.equalToSuperview().offset(20.0)
            make.width.greaterThanOrEqualTo(30)
        }
        
        let editButton = UIButton()
        editButton.setTitle(NSLocalizedString("Edit", comment: ""), for: .normal)
        view.addSubview(editButton)
        editButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
        }
        
    }
    
    func configure() {
        self.collectionView.reloadData()
    }
    
    // MARK: - Selectors
    @objc func tapOnEdit() {
        
        
    }
    
}

extension CarouselViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.getPostsCount()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCollectionViewCell.reuseIdentifier(), for: indexPath)
        
        guard let userCell = cell as? PageCollectionViewCell,
            let post = self.presenter.getPost(atIndex: indexPath.item),
            let imageURL = post.imageURL else {
            return cell
        }
        
        let date = Date(timeIntervalSince1970: post.timestamp)
        userCell.likesLabel.text = String.string(withLikes: post.likes)
        userCell.textView.text = post.text
        userCell.dateLabel.text = date.formattedDate()
        Nuke.loadImage(with: imageURL, into: userCell.imageView)
        
        return userCell
    }
    
}
