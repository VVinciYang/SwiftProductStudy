//
//  ArtistTableViewCell.swift
//  SwiftProductStudy
//
//  Created by vinci on 2017/7/8.
//  Copyright © 2017年 vinci. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {
    
    var bioLabel: UILabel!
    var nameLabel: UILabel!
    var artistImageView: UIImageView!

    var label = UILabel()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
