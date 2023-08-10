// The Swift Programming Language
// https://docs.swift.org/swift-book


let farm = try! Parser.parse()

print("Farm name: \(farm.farmName)")

for animal in farm.animals {
    switch animal {
    case let cow as Cow:
        print("\(cow.type): Milk per day: \(cow.milkPerDay), Grass requirements: \(cow.grassRequirements)")
    case let dog as Dog:
        print("\(dog.type):Name: \(dog.name), Speed: \(dog.speed), Command abilities: \(dog.commandAbilities.joined(separator: ", "))")
    case let fish as Fish:
        print("\(fish.type):Weight: \(fish.weight), Swimming speed: \(fish.swimmingSpeed), Scale color: \(fish.scaleColor)")
    default:
        break
    }
}
