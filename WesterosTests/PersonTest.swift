//
//  CharacterTest.swift
//  Westeros
//
//  Created by yisus on 06/07/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTest: XCTestCase {
    
    var starkImage : UIImage!
    var lanniesterImage : UIImage!
    
    var starkSigil : Sigil!
    var lannisterSigil: Sigil!
    
    var starkHouse: House!
    var lanniesterHouse: House!
    
    var robb: Person!
    var arya: Person!
    var tyrion: Person!
    var ned : Person!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming", url: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!)
        ned = Person(name: "Eddard",alias: "Ned", house: self.starkHouse)
        
        starkImage = #imageLiteral(resourceName: "codeIsComing.png")
        lanniesterImage = #imageLiteral(resourceName: "lannister.jpg")
        
        starkSigil = Sigil(image: starkImage, description: "Direwolf")
        lannisterSigil = Sigil(image: lanniesterImage, description: "Rampant Lion")
        
        lanniesterHouse = House(name: "Lannister",sigil: lannisterSigil, words: "Hear me roar!",url: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!)
        
        robb = Person(name: "Robb", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", house: lanniesterHouse)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCharacterExistence ()  {
        XCTAssertNotNil(tyrion)
    }
    
    func testFullName () {
        XCTAssertEqual(ned.fullName, "Eddard Stark")
    }
    
    func testPersonEquality () {
        // Identidad
        XCTAssertEqual(tyrion,tyrion)
        // Igualdad
        let imp = Person(name: "Tyrion", house: lanniesterHouse)
        XCTAssertEqual(imp,tyrion)
        // Desigualdad
        XCTAssertNotEqual(tyrion, arya)
    }
}
