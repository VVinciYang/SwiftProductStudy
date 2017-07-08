//
//  ArtistListViewController.swift
//  SwiftProductStudy
//
//  Created by vinci on 2017/7/7.
//  Copyright © 2017年 vinci. All rights reserved.
//

import UIKit

class ArtistListViewController: UIViewController {

    let artists = Artist.artistsFromBundle()
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        NotificationCenter.default.addObserver(forName: .UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) { [weak self] _ in
            self?.tableView.reloadData()
        }
        
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ArtistListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArtistTableViewCell
        
        let artist = artists[indexPath.row]
        
        cell.bioLabel.text = artist.bio
        cell.bioLabel.textColor = UIColor(white: 114/255, alpha: 1)
        
        cell.artistImageView.image = artist.image
        cell.nameLabel.text = artist.name
        
        cell.nameLabel.backgroundColor = UIColor(red: 1, green: 152/255, blue: 0, alpha: 1)
        cell.nameLabel.textColor = UIColor.white
        cell.nameLabel.textAlignment = .center
        cell.selectionStyle = .none
        
        cell.nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        cell.bioLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        return cell
    }

}
