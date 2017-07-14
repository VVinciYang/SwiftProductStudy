//
//  InterestCollectionViewCell.swift
//  SwiftProductStudy
//
//  Created by vinci on 2017/7/12.
//  Copyright © 2017年 vinci. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    var featuredImageView: UIImageView!
    var titleLabel: UILabel!
    
    //MARK: - public API
    var interest: Interset! {
        didSet {
            updateUI()
        }
    }
    
    fileprivate func updateUI() {
        titleLabel.text = interest.title
        featuredImageView.image = interest.featuredImage
    }
    
    //MARK: - refactor layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 8.0
        self.clipsToBounds = true
    }
    
}
