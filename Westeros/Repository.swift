//
//  Repositoru.swift
//  Westeros
//
//  Created by yisus on 11/07/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import Foundation

final class Repository {
    
    static let local = LocalFactory.init()
    
}

protocol HouseFactory {
    typealias Filter = (House)->Bool
    
    var houses: [House] {get}
    func house(named: String)->House?
    func houses(filteredBy: Filter) -> [House]
}

protocol SeasonFactory {
    typealias Filter = (Season)->Bool
    
    var seasons: [Season] {get}
    func seasons(filteredBy: Filter) -> [Season]
}

final class LocalFactory: HouseFactory {
    
    func houses(filteredBy: (House) -> Bool) -> [House] {
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }
    
    var houses: [House] {
        get {
            // Aquí es donde te creas tus casas
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            
            let stark = House(name: "Stark",sigil: starkSigil,words: "Winter is comming!", url: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!)
            let lannister = House(name: "Lannister",sigil: lannisterSigil,words: "Hear me roar", url: URL(string: "http://awoiaf.westeros.org/index.php/House_Lannister")!)
            let targaryen = House(name: "Targaryen", sigil: targaryenSigil, words: "Hear me roar", url: URL(string: "http://awoiaf.westeros.org/index.php/House_Lannister")!)
            
            let robb = Person(name: "Robb",alias: "The young wolf",house: stark)
            let arya = Person(name: "Arya",house: stark)
            
            let tyrion = Person(name: "Tyrion",alias: "The Imp", house: lannister)
            let cersei = Person(name: "Cersei",house: lannister)
            
            let person1 = Person(name: "Person1", alias: "person 1", house: targaryen)
            
            stark.add(person: robb)
            stark.add(person: arya)
            
            lannister.add(person: tyrion)
            lannister.add(person: cersei)
            
            targaryen.add(person: person1)
            
            return [stark,lannister,targaryen].sorted()
        }
    }
    
    func house(named: String) -> House? {
        let house = houses.filter{$0.name.uppercased() == named.uppercased()}.first
        return house;
    }
    
}


extension LocalFactory: SeasonFactory {
    
    func seasons(filteredBy: (Season) -> Bool) -> [Season] {
        let filtered = Repository.local.seasons.filter(filteredBy)
        return filtered
    }
    
    var seasons: [Season] {
        get {
            var aux = [Season]()
            
            for index in 1...6 {
                let season: Season = Season(title: "Season \(index)", date: Date())
                
                season.add(episode: Episode(title: "Episode 1",date: Date()))
                season.add(episode: Episode(title: "Episode 2",date: Date()))
                
                aux.append(season)
            }
            
            return aux
        }
    }
    
}
