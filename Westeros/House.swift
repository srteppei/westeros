//
//  House.swift
//  Westeros
//
//  Created by yisus on 06/07/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import UIKit

typealias Words = String
typealias Members = Set<Person>

final class House {
    
    let name:  String
    let sigil: Sigil
    let words: Words
    let wikiURL: URL
    private var _members: Members
    
    init(name: String,sigil: Sigil,words: Words, url: URL) {
        (self.name,self.sigil,self.words,self.wikiURL) = (name,sigil,words,url)
        _members = Members()
    }
    
    var count: Int {
        return _members.count
    }
    
    func add (person: Person) {
        guard person.house == self else {
            return
        }
        _members.insert(person)
    }
    // Varidic person
    func add(persons: Person...) {
        for person in persons {
            add(person: person)
        }
    }
    
    // Sorted (Person)
    func sortedMembers () -> [Person] {
        return Array(_members).sorted()
    }
    
}

extension House {
    var proxyForEquality: String {
        return "\(name) \(words) \(count)"
    }
}

extension House: Equatable {
    public static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension House: Hashable {
    var hashValue: Int {
        get {
            return proxyForEquality.hashValue
        }
    }
}

extension House: Comparable {
    
    public static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality < rhs.proxyForEquality
    }
    
    public static func <=(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality <= rhs.proxyForEquality
    }
    
    public static func >=(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality >= rhs.proxyForEquality
    }
    
    public static func >(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality > rhs.proxyForEquality
    }
}

final class Sigil {
    
    let description: String
    let image: UIImage
    
    init(image: UIImage,description: String) {
        (self.description,self.image) = (description,image)
    }
}
