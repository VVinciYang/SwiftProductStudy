//
//  AnimationViewController.swift
//  SwiftProductStudy
//
//  Created by vinci on 2017/7/13.
//  Copyright © 2017年 vinci. All rights reserved.
//

import UIKit

let headerHeight = 50.0
let segueDetailIdentifier = "toAnimateDetail"
let duration = 1.5

class AnimationViewController: UIViewController {

    var masterTableView: UITableView!
    
    fileprivate let items = ["2-Color", "Simple 2D Rotation", "Multicolor", "Multi Point Position", "BezierCurve Position","Color and Frame Change", "View Fade In", "Pop"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func animateTable() {
        masterTableView.reloadData()
        
        let cells = masterTableView.visibleCells
        let tableHeight = masterTableView.bounds.size.height

        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        for cell in cells {
            UIView.animate(withDuration: duration, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion:nil)
            index += 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 }

extension AnimationViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIde = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIde, for: indexPath)
        
        cell.textLabel?.text = self.items[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    
}

extension AnimationViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(headerHeight)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Basic Animations"
    }

}











