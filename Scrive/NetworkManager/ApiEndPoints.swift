//
//  ApiEndPoints.swift
//  Created by Srikanth on 23/03/23.

import Foundation

struct ApiBaseUrls {
    static var baseUrl: String {
        switch AppManager.environment {
            case .staging:
                return "https://stx.yoursalonapp.com:3050/api/"
            case .production:
                return "https://stx.yoursalonapp.com:3050/api/"
        }
    }
    
    static var forceUpdateBaseUrl: String {
        return "https://mobileapps.webappclouds.net/api/app/"
    }
}

enum ApiEndPoints: String {
    case login = "users/login"
    case checkForForceUpdate = "check-for-force-update"
    
    var endPoint: String {
        return ApiBaseUrls.baseUrl + self.rawValue
    }
    
    var forceEndPoint: String {
        return ApiBaseUrls.forceUpdateBaseUrl + self.rawValue
    }
}
