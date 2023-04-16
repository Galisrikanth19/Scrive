//
//  JsonDecoderExtensions.swift
//  Created by Srikanth on 03/04/22.

import Foundation

extension JSONDecoder {
    static func snakeCaseDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    
    static func decodeFromSnakeCase<T: Decodable>(jsonData: Data) -> T {
        let decoder = JSONDecoder.snakeCaseDecoder()
        let data: T = try! decoder.decode(T.self, from: jsonData)
        return data
    }
    
    static func decodeArrayFromSnakeCase<T: Decodable>(jsonData: Data) -> [T] {
        let decoder = JSONDecoder.snakeCaseDecoder()
        let data: [T] = try! decoder.decode([T].self, from: jsonData)
        return data
    }
}

extension Decodable {
    static func decode(_ json: String) -> Self {
        let jsonData = json.data(using: .utf8)!
        return decode(jsonData);
    }
    
    static func decode(_ dic: [String:Any]) -> Self {
        let jsonData = try! JSONSerialization.data(withJSONObject: dic, options: [])
        return decode(jsonData);
    }
    
    static func decode(_ jsonData: Data) -> Self {
        return JSONDecoder.decodeFromSnakeCase(jsonData: jsonData)
    }
    
    static func decode(_ jsonData: Data) -> [Self] {
        return JSONDecoder.decodeArrayFromSnakeCase(jsonData: jsonData)
    }
}
