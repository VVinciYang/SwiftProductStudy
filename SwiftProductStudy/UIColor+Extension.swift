//
//  UIColor+Extension.swift
//  SwiftProductStudy
//
//  Created by vinci on 2017/7/12.
//  Copyright © 2017年 vinci. All rights reserved.
//

import UIKit

public extension UIColor {
    convenience init(r: Int,g: Int, b: Int, a: CGFloat) {
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: a)
    }
    
    convenience init(hex: Int) {
        self.init(r: (hex & 0xff0000), g: (hex & 0x00ff00), b: (hex & 0x0000ff), a: 1)
    }
}
