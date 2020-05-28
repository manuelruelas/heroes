//
//  SuperheroAPI.swift
//  heros
//
//  Created by Jorge Guzman on 22/05/20.
//  Copyright © 2020 mruelas. All rights reserved.
//

import Foundation
import Combine

enum SuperHeroAPI{
    static let client = Networking()
    static let base = URL(string: "https://superheroapi.com")!
    static let token = "3254228181262627"
}

extension SuperHeroAPI{
    static func hero(id:Int)-> AnyPublisher<Hero,Error>{
        let request = URLRequest(url: base.appendingPathComponent("api/\(token)/\(String(id))"))
        return client.run(request)
        .map(\.value)
        .eraseToAnyPublisher()
    }
    
    static func search(byName name:String) -> AnyPublisher<SearchHeroResponse,Error>{
        let request = URLRequest(url: base.appendingPathComponent("api/\(token)/search/\(name)"))
        return client.run(request)
        .map(\.value)
        .eraseToAnyPublisher()
    }
}
