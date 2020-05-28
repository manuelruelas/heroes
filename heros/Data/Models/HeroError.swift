//
//  HeroError.swift
//  heros
//
//  Created by Jorge Guzman on 20/05/20.
//  Copyright © 2020 mruelas. All rights reserved.
//

import Foundation
enum HeroError: Error{
    case parsing(description: Error)
    case network(description: String)
}
