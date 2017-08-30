//
//  ArrayDataSourceTeast.swift
//  Westeros
//
//  Created by yisus on 18/07/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import XCTest
import UIKit
@testable import Westeros

class ArrayDataSourceTeast: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testArrayDataSOurceCreation () {
        
        let ds = ArrayDataSource(model: [1,2,3,4],cellMaker: { (number: Int,tableView: UITableView) -> UITableViewCell in
        
            let cellId = "NumberCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
            }
            
            cell?.textLabel?.text = "El número \(number)"
            return cell!
            
        })
        
        XCTAssertNotNil(ds)
    }
    
}
