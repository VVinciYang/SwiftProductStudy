//
//  FBMeBaseCell.swift
//  SwiftProductStudy
//
//  Created by vinci on 2017/7/12.
//  Copyright © 2017年 vinci. All rights reserved.
//

import UIKit

class FBMeBaseCell: UITableViewCell {
    
    static let identifer = "FBMeBaseCell"

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = Specs.color.white
        textLabel?.textColor = Specs.color.black
        textLabel?.font = Specs.font.large
        
        detailTextLabel?.font = Specs.font.small
        detailTextLabel?.textColor = Specs.color.gray
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemeted")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
