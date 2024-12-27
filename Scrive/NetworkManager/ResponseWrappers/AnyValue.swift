//
//  AnyValue.swift
//  Created by GaliSrikanth on 27/12/24.

enum AnyValue: Codable {
    case int(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        if let int = try? decoder.singleValueContainer().decode(Int.self) {
            self = .int(int)
            return
        }
        
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }
        
        throw QuantumError.missingValue
    }
    
    enum QuantumError:Error {
        case missingValue
    }
}

// MARK: - Accessing Int from AnyValue -
extension AnyValue {
    var intValue: Int? {
        switch self {
            case .int(let value):
                return value
            case .string(let value):
                return Int(value)
        }
    }
}
