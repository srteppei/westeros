//
//  Character.swift
//  Westeros
//
//  Created by yisus on 06/07/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import Foundation

final class Person {

    let name: String
    private let _alias: String?
    let house: House
    
    var alias: String {
        get{
            return _alias ?? ""
        }
    }
    
    init (name: String, alias: String?, house: House) {
        self.name = name
        self.house = house
        _alias = alias
    }
    
    convenience init (name: String,house: House) {
        self.init(name: name, alias: nil, house: house)
    }
    
}

extension Person {
    
    var fullName: String {
        get {
            return "\(name) \(house.name)"
        }
    }
}

extension Person {
    var proxy: String {
        get {
            return "\(name) \(alias) \(house.name)"
        }
    }
}

extension Person: Hashable {
    var hashValue: Int {
        get {
            return proxy.hashValue
        }
    }
}

extension Person: Equatable {
    static func ==(lsh: Person, rhs: Person) -> Bool{
        return lsh.proxy == rhs.proxy
    }
}

extension Person: Comparable {
    
    public static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.fullName < rhs.fullName
    }
    
    public static func <=(lhs: Person, rhs: Person) -> Bool {
        return lhs.fullName <= rhs.fullName
    }
    
    public static func >=(lhs: Person, rhs: Person) -> Bool {
        return lhs.fullName >= rhs.fullName
    }
    
    public static func >(lhs: Person, rhs: Person) -> Bool {
        return lhs.fullName > rhs.fullName
    }
    
}
