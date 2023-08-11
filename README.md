**Swift Polymorphic Deserialization Challenge**

**Objective**:
You are given a JSON string representing a farm. The farm contains a list of animals. Your task is to deserialize this JSON into a Swift struct while maintaining a clean architecture. 

**Details**:

1. Each animal in the list is recognized by the "type" field.
2. Each type of animal has unique fields associated with it.

The JSON structure is as follows:

```json
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
```

**Expected structs**:

```swift
struct Farm {
    let farmName: String
    let animals: [Animal]
}

protocol Animal {
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
```

**Requirements**:

1. Use the native Swift libraries for JSON decoding (`JSONDecoder`).
2. You should create a custom `Decodable` implementation for the `Farm` struct to handle the polymorphic deserialization of the animals.
3. Proper error handling should be implemented. If an unknown animal type is encountered, your decoder should throw a meaningful error.
4. Write a simple main function to demonstrate the decoding of the given JSON string into the `Farm` struct.
5. Provide a way to print the deserialized farm and its animals.

**Tips**:
- Consider how the `init(from decoder: Decoder)` function for the `Decodable` protocol can be leveraged.
- Think about how you can switch on the "type" field to decode different animal structures.

**Bonus**:
Write unit tests to validate your solution for the given JSON, potential edge cases, and error scenarios.