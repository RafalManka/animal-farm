// The Swift Programming Language
// https://docs.swift.org/swift-book


let farm = try! Parser.parse()

print("Farm name: \(farm.farmName)")

for animal in farm.animals {
    print("Animal type: \(animal.type)")
    if let cow = animal as? Cow {
        print("Milk per day: \(cow.milkPerDay), Grass requirements: \(cow.grassRequirements)")
    } else if let dog = animal as? Dog {
        print("Name: \(dog.name), Speed: \(dog.speed), Command abilities: \(dog.commandAbilities.joined(separator: ", "))")
    } else if let fish = animal as? Fish {
        print("Weight: \(fish.weight), Swimming speed: \(fish.swimmingSpeed), Scale color: \(fish.scaleColor)")
    }
}
