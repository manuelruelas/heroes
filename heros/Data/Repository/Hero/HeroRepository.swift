//
//  HeroRepository.swift
//  heros
//
//  Created by Jorge Guzman on 23/05/20.
//  Copyright © 2020 mruelas. All rights reserved.
//

import Foundation
import Combine

class HeroRepository{
    let heroService:HeroService = HeroService()
    private var disposables = Set<AnyCancellable>()
    
    func getHero(id:Int)-> Future<Hero,Error>{
        return Future{promise in
            self.heroService.getHero(byId: id)
                .sink(receiveCompletion: { _ in },
                receiveValue: { promise(.success($0))})
                    .store(in: &self.disposables)
        }
    }
    
    func searchHero(by name:String)-> Future<[Hero],Error>{
        return Future{ promise in
            self.heroService.searchHero(byName: name)
                .sink(receiveCompletion: { value in
                },
                      receiveValue: { searchResponse in
                        promise(.success(searchResponse.results))
                        
                })
                .store(in: &self.disposables)
        }
            
    }
    
    func fetchMoreHeroes(skip:Int) -> Future<[Hero],Error >{
        let requests = (skip...skip+10).compactMap(heroService.getHero(byId:))
        
        return Future<[Hero], Error>{ promise in
            Publishers.MergeMany(requests)
                .collect()
                .sink(receiveCompletion: { _ in},receiveValue: {promise(.success($0))})
                .store(in: &self.disposables)
        }
    }
}
