//
//  Utils.swift
//  SwiftProductStudy
//
//  Created by vinci on 2017/7/5.
//  Copyright © 2017年 vinci. All rights reserved.
//

import Foundation

func datefromString(_ date: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.date(from: date)
}

func stringFromDate(_ date: Date) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.string(from: date)
}
