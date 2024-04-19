//
//  MyResponseModel.swift
//  Created by GaliSrikanth on 19/04/24.

import Foundation

struct MyResponseModel: Codable {
    let status: Bool
    let message: String
    let data: ResponseModel
}

struct ResponseModel: Codable {
    let message: MessagesModel
}

struct MessagesModel: Codable {
    let payment_info_key: String
    let payment_info: String
    let prepaid_single: String
}
