//
//  AppUtility.swift
//  Created by Srikanth on 01/01/23

import UIKit

struct AppUtility {
    static func getFontsList() {
        for family in UIFont.familyNames {
            let sName: String = family as String
            print("family: \(sName)")
            
            for name in UIFont.fontNames(forFamilyName: sName) {
                print("name: \(name as String)")
            }
        }
    }
    
    static func readJSONFromFile<T: Codable>(WithFileName fileName: String) -> T? {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("File not found")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let myResponseModel = try decoder.decode(T.self, from: data)
            return myResponseModel
        } catch {
            print("Error reading JSON from file:", error)
        }
        
        return nil
    }
}
