//
//  HomeViewController.swift
//  SwiftProductStudy
//
//  Created by vinci on 2017/7/12.
//  Copyright © 2017年 vinci. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var backgroundImageView: UIImageView!
    var collectionView: UICollectionView!
    
    fileprivate var interests = Interset.createInterests()
    
    fileprivate struct Storyboard {
        static let cellIndentifier = "Interest Cell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK : - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.cellIndentifier, for: indexPath) as! InterestCollectionViewCell
        
        cell.interest = interests[(indexPath as NSIndexPath).item]
        
        return cell
    }
}


extension HomeViewController: UICollectionViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthWithSpace = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        
        let index = (offset.x + scrollView.contentInset.left) / cellWidthWithSpace
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthWithSpace - scrollView.contentInset.left, y: -scrollView.contentInset.top)
    }

}













