//
//  SeasonViewController.swift
//  Westeros
//
//  Created by yisus on 30/08/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import UIKit

class SeasonViewController: UIViewController {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    
    let model: Season
    
    init(model: Season) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        self.title = model.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel () {
        lbTitle.text = model.title
        lbDate.text = model.date.description
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        syncViewWithModel()
    }

}
