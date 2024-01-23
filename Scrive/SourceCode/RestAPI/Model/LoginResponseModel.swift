//
//  LoginResponseModel.swift
//  Created by Srikanth on 14/08/23.

import Foundation

struct LoginResponseModel: Codable {
    let status: Bool?
    let result: LoginModel?
    let message: String?
}

struct LoginModel: Codable {
    let rights: String?
    let viewOnlyMyAppointmentsC: Int?
    let userName, id, firstName: String?
    let requireVisitType: Bool?
    let image, token: String?
    let hideClientContactInfoC: Int?
    let pushtoken, lastName: String?
}
