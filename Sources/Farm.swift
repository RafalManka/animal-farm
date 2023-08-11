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
            let animalDict = try animalsArrayContainer.decode([String: AnyCodable].self)
            if let typeValue = animalDict["type"]?.value as? String, let type = AnimalTypes(rawValue: typeValue) {
                let animalData = try JSONEncoder().encode(animalDict)
                switch type {
                case .cow:
                    let cow = try JSONDecoder().decode(Cow.self, from: animalData)
                    animals.append(cow)
                case .dog:
                    let dog = try JSONDecoder().decode(Dog.self, from: animalData)
                    animals.append(dog)
                case .fish:
                    let fish = try JSONDecoder().decode(Fish.self, from: animalData)
                    animals.append(fish)
                }
            }
        }
        
        self.animals = animals
    }
}

struct AnyCodable: Codable {
    var value: Any

    init<T>(_ value: T?) {
        self.value = value as Any
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let val = try? container.decode(Bool.self) {
            self.value = val
        } else if let val = try? container.decode(Int.self) {
            self.value = val
        } else if let val = try? container.decode(Double.self) {
            self.value = val
        } else if let val = try? container.decode(String.self) {
            self.value = val
        } else if let val = try? container.decode([AnyCodable].self) {
            self.value = val.map { $0.value }
        } else if let val = try? container.decode([String: AnyCodable].self) {
            var dict = [String: Any]()
            for (key, anyCodable) in val {
                dict[key] = anyCodable.value
            }
            self.value = dict
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "AnyCodable value cannot be decoded")
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self.value {
        case let value as Bool:
            try container.encode(value)
        case let value as Int:
            try container.encode(value)
        case let value as Double:
            try container.encode(value)
        case let value as String:
            try container.encode(value)
        case let value as [Any]:
            try container.encode(value.map { AnyCodable($0) })
        case let value as [String: Any]:
            let convertedDict = value.reduce(into: [String: AnyCodable]()) { $0[$1.key] = AnyCodable($1.value) }
            try container.encode(convertedDict)
        default:
            throw EncodingError.invalidValue(self.value, EncodingError.Context(codingPath: [], debugDescription: "AnyCodable value cannot be encoded"))
        }
    }
}
