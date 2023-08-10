//
//  File.swift
//  
//
//  Created by Rafal Manka on 10/08/2023.
//

import Foundation


fileprivate let filePath = "/Users/rafal.manka/Documents/emirates/animals/Sources/animals.json"

class AnimalParser {
    
    func parse() throws -> Farm {
        let jsonData = readJSONFromFile(fileName: filePath)!
        let farm = try! JSONDecoder().decode(Farm.self, from: jsonData)
        return farm
    }
    
    func readJSONFromFile(fileName: String) -> Data? {
        let fileManager = FileManager.default
        let filePath =  fileName
        let url = URL(fileURLWithPath: filePath)
        
        guard let data = try? Data(contentsOf: url) else {
            print("Unable to read the file \(fileName)")
            return nil
        }
        
        return data
    }
}
