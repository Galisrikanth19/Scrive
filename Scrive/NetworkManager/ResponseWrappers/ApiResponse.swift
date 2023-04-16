//
//  ApiResponse.swift
//  Created by Srikanth on 16/03/23.

import Foundation

struct ApiResponse: Decodable {
    @DecodableDefault.False var status: Bool
    @DecodableDefault.Integer var statusCode: Int
    @DecodableDefault.EmptyString var message: String
}

struct ApiResponseObject<T: Decodable>: Decodable {
    @DecodableDefault.False var status: Bool
    @DecodableDefault.Integer var statusCode: Int
    @DecodableDefault.EmptyString var message: String
    let data: T?
}

struct ApiResponseArray<T: Decodable>: Decodable {
    @DecodableDefault.False var status: Bool
    @DecodableDefault.Integer var statusCode: Int
    @DecodableDefault.EmptyString var message: String
    let data: [T]?
}
