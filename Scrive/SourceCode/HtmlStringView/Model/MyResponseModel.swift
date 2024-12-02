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
    let paymentInfoKey: String
    let paymentInfo: String
    let prepaidSingle: String
}
