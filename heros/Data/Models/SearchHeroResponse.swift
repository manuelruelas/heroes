//
//  SearchHeroResponse.swift
//  heros
//
//  Created by Jorge Guzman on 27/05/20.
//  Copyright © 2020 mruelas. All rights reserved.
//

import Foundation

struct SearchHeroResponse: Decodable {
    var response:String
    var results: [Hero]
}
