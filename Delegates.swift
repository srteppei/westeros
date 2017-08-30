//
//  Delegates.swift
//  Westeros
//
//  Created by yisus on 18/07/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import UIKit

final class Delegates {

    static func houseDelegate(model: [House]) -> ArrayTableViewDelegate<House> {
        return ArrayTableViewDelegate(model: model,didSelected: {(house: House) -> UIViewController in
            let houseVC = HouseViewController(model: house)
            return houseVC;
        })
    }
    
    static func seasonDelegate(model: [Season]) -> ArrayTableViewDelegate<Season> {
        return ArrayTableViewDelegate(model: model,didSelected: {(house: Season) -> UIViewController in
            let seasonVC = SeasonViewController(model: house)
            return seasonVC;
        })
    }
    
}
