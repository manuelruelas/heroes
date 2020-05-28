//
//  HeroService.swift
//  heros
//
//  Created by Jorge Guzman on 23/05/20.
//  Copyright © 2020 mruelas. All rights reserved.
//

import Foundation
import Combine
class HeroService{
    func getHero(byId id:Int) -> AnyPublisher<Hero,Error> {
        return SuperHeroAPI.hero(id: id)
    }
    
    func searchHero(byName name:String) -> AnyPublisher<SearchHeroResponse,Error> {
        return SuperHeroAPI.search(byName: name)
    }
}
