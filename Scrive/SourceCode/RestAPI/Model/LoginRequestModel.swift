//
//  LoginRequestModel.swift
//  Created by Webappclouds on 14/08/23.

import Foundation

struct LoginRequestModel: Codable {
    let userName: String?
    let password: String?
    let Pushtoken: String?
}