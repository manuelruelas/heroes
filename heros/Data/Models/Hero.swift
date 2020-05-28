//
//  Hero.swift
//  heros
//
//  Created by Jorge Guzman on 20/05/20.
//  Copyright © 2020 mruelas. All rights reserved.
//

import Foundation

class Hero: Decodable {
    var id:String
    var name: String
    var powerstats: Powerstats?
    var biography: Biography?
    var image: Img?
    
   
    private enum CodingKeys:String,CodingKey{
        case id
        case name
        case image
        case powerstats
        case biography
    }
}

class Img: Decodable {
     var url: String
    
    private enum CodingKeys:String,CodingKey{
        case url
    }
}

// MARK: - Biography
class Biography: Decodable {
     var fullName:String
     var alterEgos: String
     var placeOfBirth:String
     var firstAppearance: String
     var publisher:String
     var alignment: String
    
    enum CodingKeys: String, CodingKey{
        case fullName = "full-name"
        case alterEgos = "alter-egos"
        case placeOfBirth = "place-of-birth"
        case firstAppearance = "first-appearance"
        case publisher
        case alignment
    }
}


// MARK: - Powerstats
class Powerstats: Decodable {
     var intelligence: String
     var strength:String
     var speed: String
     var durability: String
     var power: String
     var combat: String
    
    enum CodingKeys:String,CodingKey{
        case intelligence
        case strength
        case speed
        case durability
        case power
        case combat
    }
}


