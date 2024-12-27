//
//  RandomJsonModel.swift
//  Created by GaliSrikanth on 27/12/24.

struct RandomResponseModel: Codable {
    let status: Bool
    let message: String
    let data: [RandomModel]?
}

struct RandomModel: Codable {
    let name: String
    let runs: AnyValue?
}

