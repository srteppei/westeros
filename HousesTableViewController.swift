//
//  HousesTableViewController.swift
//  Westeros
//
//  Created by yisus on 17/07/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import UIKit

class HousesTableViewController: UITableViewController {
    
    let model: [House]
    
    init (model: [House]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Westeros"
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
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "HouseCell"
        // Descubrir cual es la casa que tenemos que mostrar
        let house = model[indexPath.row]
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if (cell == nil) {
            // creamos a pelo
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        // sincronizar House -> Call
        cell?.imageView?.image = house.sigil.image
        cell?.textLabel?.text = house.name
        
        return cell!
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let house = model[indexPath.row]
        let houseVC = HouseViewController(model: house)
        navigationController?.pushViewController(houseVC, animated: true)
    }
}
