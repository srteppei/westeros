//
//  EpisodeTest.swift
//  Westeros
//
//  Created by yisus on 21/08/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTest: XCTestCase {
    
    var episode1: Episode!
    var episode2: Episode!
    
    override func setUp() {
        super.setUp()
        
        episode1 = Episode(title: "Epidose 1",date: Date(timeIntervalSinceNow: -10000))
        episode2 = Episode(title: "Epidose 2",date: Date())
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEpisodeExistence () {
        XCTAssertNotNil(episode1)
    }
    
    func testTitle () {
        XCTAssertEqual(episode1.title, "Epidose 1")
    }
    
    func testEpisodeEquality () {
        XCTAssertEqual(episode1, episode1)
        
        let imp = Episode(title: "Epidose 1",date: Date(timeIntervalSinceNow: -10000))
        XCTAssertEqual(episode1, imp)
        
        XCTAssertNotEqual(episode1, episode2)
    }
    
    func testEpidoseComparasion () {
        XCTAssertLessThan(episode1, episode2)
    }
    
}
