//
//  HouseViewController.swift
//  Westeros
//
//  Created by yisus on 10/07/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    @IBOutlet weak var houseNameView: UILabel!
    @IBOutlet weak var wordsView: UILabel!
    
    @IBOutlet weak var sigilImageView: UIImageView!
    
    let model: House
    
    init(model: House) {
        self.model = model
        super.init(nibName: nil,bundle: nil)
        // setting tabBarItem
        self.title = model.name
        //self.tabBarItem.image = model.sigil.image
    }
    
    // Chapuza de los de Cupertino (reladcionada con los nil)
    required init?(coder aDecoder: NSCoder) {
        fatalError("ubut(coder:) has not been impmented")
    }
    
    func syncViewWithModel () {
        // model -> view
        houseNameView.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsView.text = model.words
        
        
    }
    
    func setupUI () {
        let wiki = UIBarButtonItem(title: "Wiki",
                                   style: .plain,
                                   target: self,
                                   action: #selector(displayWiki))
        
        let members = UIBarButtonItem(title: "Members",
                                      style: .plain,
                                      target: self,
                                      action: #selector(displayMembers))
        
        // Añadimos
        navigationItem.rightBarButtonItems = [wiki,members]
    }
    
    @objc func displayWiki () {
        
        // Creamos un WikiVC
        let wikiVC = WikiViewController(model: model)
        // lo cargamos en el navigation
        navigationController?.pushViewController(wikiVC, animated: true)
        
    }
    
    @objc func displayMembers () {
        let memberVC = MembersTableViewController(model: model.sortedMembers())
        navigationController?.pushViewController(memberVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        
        syncViewWithModel()
    }
}
