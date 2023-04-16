//
//  AppSingleton.swift
//  Created by Srikanth on 01/01/23

import Foundation

class AppSingleton {
    static let shared = AppSingleton()
    var accessToken: String?
    
    private init() {
    }
}
