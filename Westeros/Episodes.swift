//
//  Episodes.swift
//  Westeros
//
//  Created by yisus on 21/08/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import Foundation

final class Episode {
    
    let title: String
    let date: Date
    
    init (title: String,date: Date) {
        (self.title,self.date) = (title,date)
    }
    
}

extension Episode {
    var proxy: String {
        get {
            return "\(title) \(date)"
        }
    }
}

extension Episode: Equatable {
    static func ==(lsh: Episode, rhs: Episode) -> Bool{
        return lsh.proxy == rhs.proxy
    }
}

extension Episode: Hashable {
    var hashValue: Int {
        get {
            return proxy.hashValue
        }
    }
}

extension Episode: Comparable {
    
    public static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.date < rhs.date
    }
    
    public static func <=(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.date <= rhs.date
    }
    
    public static func >=(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.date >= rhs.date
    }
    
    public static func >(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.date > rhs.date
    }
    
}

extension Episode: CustomStringConvertible {
    public var description: String { get {
            return title
        }
    }
}
