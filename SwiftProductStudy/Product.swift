//
//  Product.swift
//  SwiftProductStudy
//
//  Created by vinci on 2017/7/4.
//  Copyright © 2017年 vinci. All rights reserved.
//

import Foundation

class Product {
    var name: String?
    var cellImageName: String?
    var fullScreenImageName: String?
    
    init(name: String, cellImageName: String, fullScreenImageName: String) {
        self.name = name
        self.cellImageName = cellImageName
        self.fullScreenImageName = fullScreenImageName
    }
    
    
    
}
