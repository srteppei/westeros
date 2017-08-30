//
//  ArrayTableViewController.swift
//  Westeros
//
//  Created by yisus on 18/07/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import UIKit

class ArrayTableViewController <Element>: UITableViewController {
        
    let dataSource: ArrayDataSource<Element>
    let delegate: ArrayTableViewDelegate<Element>
    
    init (dataSource: ArrayDataSource<Element>,delegate: ArrayTableViewDelegate<Element>,title: String,style: UITableViewStyle) {
        self.dataSource = dataSource
        self.delegate = delegate
        super.init(style: style)
        self.title = title        
        
        self.delegate.controller = self
        
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) hast not been implemented")
    }
    
}
