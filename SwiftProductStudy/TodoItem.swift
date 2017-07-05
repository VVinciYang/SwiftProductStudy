//
//  TodoItem.swift
//  SwiftProductStudy
//
//  Created by vinci on 2017/7/5.
//  Copyright © 2017年 vinci. All rights reserved.
//

import Foundation

class TodoItem: NSObject {
    var id: String
    var image: String
    var title: String
    var date: Date
    
    init(id: String, image: String, title: String, date: Date) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
}
