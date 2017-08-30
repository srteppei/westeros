//
//  ArrayTableViewDelegate.swift
//  Westeros
//
//  Created by yisus on 18/07/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import UIKit

final class ArrayTableViewDelegate <Element>: NSObject, UITableViewDelegate {

    typealias Elements = [Element]
    typealias DidSelected = (Element) -> UIViewController
    
    let _model: Elements
    let _didSelected: DidSelected
    var controller: UITableViewController?
    
    init (model: Elements,didSelected: @escaping DidSelected) {
        _model = model
        _didSelected = didSelected
        super.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Que pasa aquí dentro
        let aux = _didSelected(_model[indexPath.row])        
        controller?.navigationController?.pushViewController(aux, animated: true)
    }
}
