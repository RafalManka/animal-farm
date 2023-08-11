// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

let json = """
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

let farm = try! JSONDecoder().decode(Farm.self, from: Data(json.utf8))

print("Farm name: \(farm.farmName)")

for animal in farm.animals {
    switch animal {
    case let cow as Cow:
        print("[\(cow.type.uppercased())] Milk per day: \(cow.milkPerDay), Grass requirements: \(cow.grassRequirements)")
    case let dog as Dog:
        print("[\(dog.type.uppercased())] Name: \(dog.name), Speed: \(dog.speed), Command abilities: \(dog.commandAbilities.joined(separator: ", "))")
    case let fish as Fish:
        print("[\(fish.type.uppercased())] Weight: \(fish.weight), Swimming speed: \(fish.swimmingSpeed), Scale color: \(fish.scaleColor)")
    default:
        break
    }
}
