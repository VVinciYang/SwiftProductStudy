//
//  Interest.swift
//  SwiftProductStudy
//
//  Created by vinci on 2017/7/12.
//  Copyright © 2017年 vinci. All rights reserved.
//

import UIKit

class Interset {

    public var id: String = ""
    public var title: String = ""
    public var description: String = ""
    public var numberOfMembers = 0
    public var numberOfPosts = 0
    public var featuredImage: UIImage!
    
    
    init(id: String, title: String, description: String, featuredImage: UIImage!) {
        self.id = id
        self.title = title
        self.description = description
        self.featuredImage = featuredImage
        
        numberOfPosts = 1
        numberOfMembers = 1
    }
    
    //MARK - Private
    
    static func createInterests() -> [Interset] {
        return [
            Interset(id: "r1", title: "title", description: "we love back", featuredImage: UIImage(named: "r1")),
            Interset(id: "r1", title: "title", description: "we love back", featuredImage: UIImage(named: "r1")),
            Interset(id: "r1", title: "title", description: "we love back", featuredImage: UIImage(named: "r1")),
            Interset(id: "r1", title: "title", description: "we love back", featuredImage: UIImage(named: "r1")),
        ]
    }
    
}

