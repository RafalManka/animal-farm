//
//  File.swift
//  
//
//  Created by Rafal Manka on 10/08/2023.
//

import Foundation


fileprivate let json = """
{
    "farmName": "Green Acres",
    "animals": [
        {
            "type": "cow",
            "milkPerDay": 10,
            "grassRequirements": 20
        },
        {
            "type": "dog",
            "speed": 30,
            "name": "Buddy",
            "commandAbilities": ["sit", "fetch"]
        },
        {
            "type": "fish",
            "weight": 5,
            "swimmingSpeed": 15,
            "scaleColor": "blue"
        }
    ]
}
"""

class Parser {
    static func parse() throws -> Farm {
        return try! JSONDecoder().decode(Farm.self, from: Data(json.utf8))
    }
}
