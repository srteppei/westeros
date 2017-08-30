//
//  RepositoryTest.swift
//  Westeros
//
//  Created by yisus on 11/07/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTest: XCTestCase {
    
    var localHouses: [House]!
    var localSeasons: [Season]!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        localHouses = Repository.local.houses
        localSeasons = Repository.local.seasons
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLocalRepositoryCreation () {
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRepositoryHousesCreation () {
        let houses = Repository.local.houses
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 3)
    }
    
    func testLocalRepositorySeasonCreation () {
        XCTAssertNotNil(localSeasons)
        XCTAssertEqual(localSeasons.count, 6)
    }
    
    func testLocalREpositoryResunsSortedArrayofHouses () {
        XCTAssertEqual(localHouses, localHouses.sorted())
    }
    
    func testLocalRepositoryResunSortedArrayofSeasons () {
        XCTAssertEqual(localSeasons,localSeasons.sorted())
    }
    
    func testLocalRepoReturnsHousesByNameCaseInsensitively(){
        let stark = Repository.local.house(named: "sTarK")
        XCTAssertEqual(stark?.name, "Stark")
        
        let grinjander = Repository.local.house(named: "ginrjander")
        XCTAssertNil(grinjander)
    }
    
    func testHouseFiltering(){
        let filtered = Repository.local.houses.filter{ $0.count == 1}
        XCTAssertEqual(filtered.count, 1)
    }
    
    func testSeasonFiltering () {
        let filtered = Repository.local.seasons.filter{ $0.count == 2}
        XCTAssertEqual(filtered.count, 6)
    }
    
}
