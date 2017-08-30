//
//  SeasonTableViewController.swift
//  Westeros
//
//  Created by yisus on 30/08/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import UIKit

class SeasonTableViewController: UITableViewController {
    
    let model: [Season]
    
    init(model: [Season]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Season"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let season = model[indexPath.row]
        //let houseVC = HouseViewController(model: season)
        //navigationController?.pushViewController(houseVC, animated: true)
    }
}
