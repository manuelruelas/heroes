//
//  HeroesViewModel.swift
//  heros
//
//  Created by Jorge Guzman on 20/05/20.
//  Copyright © 2020 mruelas. All rights reserved.
//

import Foundation
import Combine

class HeroesListViewModel: ObservableObject,Identifiable {
    private let heroRepository:HeroRepository
    
    @Published var hero: String = ""
    @Published var dataSource:[HeroRowModel] = []
    @Published var status: StatusEnum = .loading
    
    private var disposables = Set<AnyCancellable>()
    private var scheduler: DispatchQueue  = DispatchQueue(label: "HeroesListViewModel")
    init(heroRepository:HeroRepository) {
        self.heroRepository = heroRepository
        observeSearchField()
        
    }
    private func observeSearchField(){
        $hero
        .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: scheduler)
        .receive(on: DispatchQueue.main)
        .sink(receiveValue:{ name in
            self.dataSource.removeAll()
            if(name.isEmpty){
                self.fetchHero()
            }else{
              self.searchHero(by: name)
            }
        })
        .store(in: &disposables)
    }
    
    func fetchHero(){
        heroRepository.fetchMoreHeroes(skip: dataSource.count + 1)
            .sink(receiveCompletion:{value in
                self.status = .ready
            },
                receiveValue:{ heroes in
                    self.status = .ready
                    self.dataSource.append(contentsOf: heroes.sorted(by: { (prvHero, hero) -> Bool in
                        return (Int(prvHero.id) ?? 0) < (Int(hero.id) ?? 0)
                    }).map(HeroRowModel.init))
                    
            }).store(in: &disposables)
    }
    func searchHero(by name:String){
        heroRepository
            .searchHero(by: name)
            .sink(receiveCompletion: {value in
                self.status = .ready
            },
                  receiveValue: { heroes in
                    self.status = .ready
                    self.dataSource.removeAll()
                    self.dataSource.append(contentsOf: heroes.map(HeroRowModel.init))
            }).store(in: &disposables)
    }
    func loadMore(id:Int) -> Void {
        if(status == .ready && dataSource.count == id){
            status = .loading
            fetchHero()
        }
    }
    
}


enum StatusEnum{
    case ready
    case loading
}
