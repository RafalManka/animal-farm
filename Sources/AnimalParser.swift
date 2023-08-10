//
//  File.swift
//  
//
//  Created by Rafal Manka on 10/08/2023.
//

import Foundation


let farmJson = """
{
    "animals": [
        {
            "cow": {
                "milkPerDay": 10,
                "grassRequirements": 20
            }
        },
        {
            "dog": {
                "commandAbilities": [
                    "fetch"
                ],
                "speed": 2,
                "name": "hau hau"
            }
        },
        {
            "fish": {
                "swimmingSpeed": 1,
                "weight": 1,
                "scaleColor": "blue"
            }
        }
    ],
    "farmName": "farmName"
}
"""

class AnimalParser {
    
    func parse() throws -> Farm {
        let data = farmJson.data(using: .utf8)
        let farm = try! JSONDecoder().decode(Farm.self, from: data!)
        return farm
    }
    
}
