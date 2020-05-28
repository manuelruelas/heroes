//
//  HeroRowViewModel.swift
//  heros
//
//  Created by Jorge Guzman on 20/05/20.
//  Copyright © 2020 mruelas. All rights reserved.
//

import Foundation

struct HeroRowModel:Identifiable {
    
    var id: String{
        return self.hero.id
    }
    let hero: Hero
    
    
    init(hero:Hero){
        self.hero = hero
    }
}

