//
//  HouseTest.swift
//  Westeros
//
//  Created by yisus on 06/07/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTest: XCTestCase {
    
    var stark: House!
    var lannister: House!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        stark = Repository.local.house(named: "Stark")
        lannister = Repository.local.house(named: "Lannister")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHouseExistence () {
    
        XCTAssertNotNil(stark)
        
    }
    
    func testSigilExistence () {
        
        XCTAssertNotNil(stark.sigil)
        
    }
    
    func testAddPerson () {

        stark.add(person: Person(name: "Tyrion",alias: "The Imp", house: lannister))
        XCTAssertEqual(stark.count, 2)
        
    }
    
    func testHouseEquality () {
        // Identidad
        XCTAssertEqual(stark,stark)
        // Igualdad
        //let jinxed = House(name: "Stark",sigil: stark.sigil,words: "Winter is comming!")
        //XCTAssertEqual(jinxed, stark)
        // Desigualda
        XCTAssertNotEqual(stark, lannister)
    }
    
    func testHasable () {
        XCTAssertNotNil(stark.hashValue)
    }
    
    func testHouseComparasion () {
        XCTAssertLessThan(lannister,stark)
    }
}
