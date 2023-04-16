//
//  ApiEndPoints.swift
//  Created by Srikanth on 23/03/23.

import Foundation

enum ApiEndPoints: String {
    case baseUrl = "http://18.116.128.93/skoah-ob/public/api/"
    
    case login = "user-login"
    
    var url: String {
        return ApiEndPoints.baseUrl.rawValue + self.rawValue
    }
}


/*
 Usage sourceCode
 ************************************************************************************************
 let restaurantUrl = ApiEndPoints.login.url
 ************************************************************************************************
 */
