//
//  StopWatch.swift
//  SwiftProductStudy
//
//  Created by vinci on 2017/7/4.
//  Copyright © 2017年 vinci. All rights reserved.
//

import Foundation

class StopWatch: NSObject {
    var counter: Double
    var timer: Timer
    override init() {
        counter = 0.0
        timer = Timer()
    }
}
