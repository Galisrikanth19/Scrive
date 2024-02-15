//
//  ApiEndPoints.swift
//  Created by Srikanth on 23/03/23.

import Foundation

struct BaseUrls {
    static let baseUrl = "https://stx.yoursalonapp.com:3050/api/"
}

enum ApiEndPoints: String {
    case login = "users/login"
    
    var baseUrl: String {
        return BaseUrls.baseUrl + self.rawValue
    }
}


/*
 Usage sourceCode
 ************************************************************************************************
 let restaurantUrl = ApiEndPoints.login.baseUrl
 ************************************************************************************************
 */
