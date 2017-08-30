//
//  ArrayDataSource.swift
//  Westeros
//
//  Created by yisus on 18/07/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import UIKit

final class ArrayDataSource <Element> : NSObject , UITableViewDataSource {
    
    typealias Elements = [Element]
    typealias CellMaker = (Element,UITableView) -> UITableViewCell
    
    private let _models: Elements
    private let _cellMaker: CellMaker
    
    init (model: Elements,cellMaker: @escaping CellMaker) {
        _models = model
        _cellMaker = cellMaker
        super.init()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _models.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let elt = _models[indexPath.row]
        return _cellMaker(elt,tableView)
    }

}
