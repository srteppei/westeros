//
//  UI.swift
//  Westeros
//
//  Created by yisus on 11/07/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func wrappedInNavigation () -> UINavigationController {
        let nav = UINavigationController(rootViewController: self)
        return nav
    }
    
}
