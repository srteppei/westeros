//
//  Season.swift
//  Westeros
//
//  Created by yisus on 21/08/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import Foundation

typealias Episodes = Set<Episode>

final class Season {
    
    let title: String
    let date: Date
    private var _episodes: Episodes
    
    init(title: String, date: Date) {
        (self.title,self.date) = (title,date)
        _episodes = Episodes()
    }
    
    var count: Int {
        return _episodes.count
    }
    
    func add(episode: Episode) {
        _episodes.insert(episode)
    }
    
    // Varidic episode
    func add(episodes: Episode...) {
        for episode in episodes {
            add(episode: episode)
        }
    }
    
    // Sorted (Person)
    func sortedEpisodes () -> [Episode] {
        return Array(_episodes).sorted()
    }

}

extension Season {
    var proxy: String {
        get {
            return "\(title) \(date)"
        }
    }
}

extension Season: Equatable {
    static func ==(lsh: Season, rhs: Season) -> Bool{
        return lsh.proxy == rhs.proxy
    }
}

extension Season: Hashable {
    var hashValue: Int {
        get {
            return proxy.hashValue
        }
    }
}

extension Season: Comparable {
    
    public static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.date < rhs.date
    }
    
    public static func <=(lhs: Season, rhs: Season) -> Bool {
        return lhs.date <= rhs.date
    }
    
    public static func >=(lhs: Season, rhs: Season) -> Bool {
        return lhs.date >= rhs.date
    }
    
    public static func >(lhs: Season, rhs: Season) -> Bool {
        return lhs.date > rhs.date
    }
    
}

extension Season: CustomStringConvertible {
    public var description: String { get {
        return title
        }
    }
}
