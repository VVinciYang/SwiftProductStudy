//
//  CandyDetailViewController.swift
//  SwiftProductStudy
//
//  Created by vinci on 2017/7/8.
//  Copyright © 2017年 vinci. All rights reserved.
//

import UIKit

class CandyDetailViewController: UIViewController {

    var detailDescriptionLabel: UILabel!
    var candyImageView: UIImageView!
    
    var detailCandy: Candy? {
        didSet {
            configView()
        }
    }
    
    func configView() {
        if let detailCandy = detailCandy {
            if let detailDescriptionLabel =  detailDescriptionLabel, let candyImageView = candyImageView {
                detailDescriptionLabel.text = detailCandy.name
                candyImageView.image = UIImage(named: detailCandy.name)
                title = detailCandy.category
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
