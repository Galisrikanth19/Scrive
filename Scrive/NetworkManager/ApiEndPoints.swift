//
//  ApiEndPoints.swift
//  Created by Srikanth on 23/03/23.

import Foundation

enum ApiEndPoints: String {
    case baseUrl = "https://stx.yoursalonapp.com:3050/api/"
    
    case login = "users/login"
    
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
