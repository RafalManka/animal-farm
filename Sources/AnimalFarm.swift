//
//  File.swift
//  
//
//  Created by Rafal Manka on 10/08/2023.
//

import Foundation

struct Farm: Decodable {
    let farmName: String
    let animals: [Animal]
}

protocol Animal: Decodable {
    var type: String { get }
}

struct Cow: Animal {
    let type: String
    let milkPerDay: Int
    let grassRequirements: Int
}

struct Dog: Animal {
    let type: String
    let speed: Int
    let name: String
    let commandAbilities: [String]
}

struct Fish: Animal {
    let type: String
    let weight: Int
    let swimmingSpeed: Int
    let scaleColor: String
}

extension Farm {
    enum FarmCodingKeys: String, CodingKey {
        case farmName
        case animals
    }

    enum AnimalTypeCodingKeys: String, CodingKey {
        case type
    }

    enum AnimalTypes: String, Decodable {
        case cow, dog, fish
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: FarmCodingKeys.self)
        farmName = try container.decode(String.self, forKey: .farmName)

        var animalsArrayContainer = try container.nestedUnkeyedContainer(forKey: .animals)
        var animals = [Animal]()

        while !animalsArrayContainer.isAtEnd {
            let animalContainer = try animalsArrayContainer.nestedContainer(keyedBy: AnimalTypeCodingKeys.self)
            let type = try animalContainer.decode(AnimalTypes.self, forKey: .type)

            switch type {
            case .cow:
                let cow = try animalsArrayContainer.decode(Cow.self)
                animals.append(cow)
            case .dog:
                let dog = try animalsArrayContainer.decode(Dog.self)
                animals.append(dog)
            case .fish:
                let fish = try animalsArrayContainer.decode(Fish.self)
                animals.append(fish)
            }
        }

        self.animals = animals
    }
}
