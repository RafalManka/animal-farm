//
//  File.swift
//  
//
//  Created by Rafal Manka on 10/08/2023.
//

import Foundation

enum Animal: Codable {
    case cow(milkPerDay: Int, grassRequirements: Int)
    case dog(speed: Int, name: String, commandAbilities: [String])
    case fish(weight: Int, swimmingSpeed: Int, scaleColor: String)
}

struct Farm: Codable {
    let farmName: String
    let animals: [Animal]
}
