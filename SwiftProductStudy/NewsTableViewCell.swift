//
//  NewsTableViewCell.swift
//  SwiftProductStudy
//
//  Created by vinci on 2017/7/8.
//  Copyright © 2017年 vinci. All rights reserved.
//

import UIKit

enum CellState {
    case expanded
    case collapsed
}

class NewsTableViewCell: UITableViewCell {

    var titleLabel: UILabel!
    var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 4
        }
    }
    
    var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
