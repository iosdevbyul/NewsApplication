//
//  SectionView.swift
//  NewsApplication
//
//  Created by COMATOKI on 2019-03-26.
//  Copyright © 2019 COMATOKI. All rights reserved.
//

import UIKit
let sectionManager = SectionManager()

class SectionView: UIView, UICollectionViewDelegateFlowLayout{
    
    
    let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: UICollectionViewFlowLayout())
    
    let cellIdentifier: String = "sectionCollectionViewCell"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func initView() {
        setCollectionView()
    }
    
    func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        collectionView.collectionViewLayout = layout
        
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(SectionCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        self.addSubview(collectionView)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.item) selected")
        NotificationCenter.default.post(name: .didClickSection, object: nil, userInfo: ["selectedRegionSection":indexPath.item])
//        NotificationCenter.default.post(name: .didReceiveData, object: nil)
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: self.frame.size.height)
    }
    
}

class NewsCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    let sectionNameLabel : UILabel = UILabel()
    
    func setupCell() {
        self.backgroundColor = .gray
        sectionNameLabel.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        sectionNameLabel.text = "123"
        sectionNameLabel.textAlignment = .center
        sectionNameLabel.textColor = .white
        self.addSubview(sectionNameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class SectionCollectionViewCell: UICollectionViewCell {
    
    var sectionNameLabel :UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        
        self.backgroundColor = .gray
        
        sectionNameLabel = UILabel()
        self.addSubview(sectionNameLabel)
        
        sectionNameLabel.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        
        sectionNameLabel.textAlignment = .center
        sectionNameLabel.textColor = .white
        self.addSubview(sectionNameLabel)
    }
}


extension UIView: UICollectionViewDataSource, UICollectionViewDelegate {

    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionManager.getNewsSectionCount()
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sectionCollectionViewCell", for: indexPath) as? SectionCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.sectionNameLabel.text = sectionManager.getNewsSection()[indexPath.item]
        return cell
        
    }
    
   
    
    
}

