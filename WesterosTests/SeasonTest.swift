//
//  SeasonTest.swift
//  Westeros
//
//  Created by yisus on 29/08/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTest: XCTestCase {
    
    var season1: Season!
    var season2: Season!
    
    override func setUp() {
        super.setUp()
        
        let episode1: Episode = Episode(title: "Epidose 1",date: Date(timeIntervalSinceNow: -10000))
        let episode2: Episode = Episode(title: "Epidose 2",date: Date())
        
        season1 = Season(title: "Season 1",date: Date())
        season1.add(episode: episode1)
        season1.add(episode: episode2)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSeasonExistence () {
        XCTAssertNotNil(season1)
    }
    
    func testEspisodesBiggerThan0 () {
        XCTAssertEqual(season1.count, 2)
    }
    
}
