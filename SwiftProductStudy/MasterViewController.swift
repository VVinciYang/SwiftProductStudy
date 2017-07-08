//
//  MasterViewController.swift
//  SwiftProductStudy
//
//  Created by vinci on 2017/7/8.
//  Copyright © 2017年 vinci. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController?
    var candies = [Candy]()
    var filteredCandies = [Candy]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        candies = [Candy(category: "category1", name: "name1"),
        Candy(category:"Chocolate", name:"Chocolate Chip")]
        
        
        
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
