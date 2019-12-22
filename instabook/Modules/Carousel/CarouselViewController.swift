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
}

protocol CarouselViewInput: class {
    
    func configure()
    
}

class CarouselViewController: UIViewController, CarouselViewInput {
    var collectionView: UICollectionView!
    var presenter: CarouselViewOutput!
    
    let postWidth = UIScreen.main.bounds.size.width - 40
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CarouselPresenter(model: CarouselModel(), view: self)
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
    }
    
    func configure() {
        self.collectionView.reloadData()
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
