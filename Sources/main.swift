// The Swift Programming Language
// https://docs.swift.org/swift-book


let parser = AnimalParser()
let farm = try! parser.parse()
print("Farm name: \(farm.farmName)")
for animal in farm.animals {
    print("Animal type: \(animal.self)")
    switch animal {
    case .cow(milkPerDay: let milkPerDay, grassRequirements: let grassRequirements):
        print("Milk per day: \(milkPerDay), Grass requirements: \(grassRequirements)")
    case .dog(speed: let speed, name: let name, commandAbilities: let commandAbilities):
        print("Name: \(name), Speed: \(speed), Command abilities: \(commandAbilities.joined(separator: ", "))")
    case .fish(weight: let weight, swimmingSpeed: let swimmingSpeed, scaleColor: let scaleColor):
        print("Weight: \(weight), Swimming speed: \(swimmingSpeed), Scale color: \(scaleColor)")
    }
}

