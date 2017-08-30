//
//  EpisodeTableViewController.swift
//  Westeros
//
//  Created by yisus on 30/08/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import UIKit

class EpisodeTableViewController: UITableViewController {
    
    let model: [Episode]
    
    init(model: [Episode]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Episode"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "Episode"
        // Descubrir cual es la casa que tenemos que mostrar
        let episode = model[indexPath.row]
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if (cell == nil) {
            // creamos a pelo
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        // sincronizar House -> Call
        cell?.textLabel?.text = episode.title
        
        return cell!
    }


}
