//
//  AppManager.swift
//  Created by GaliSrikanth on 23/09/24.

import Foundation

enum Environments {
    case staging
    case production
}

struct AppManager {
    static let environment: Environments = .staging
}
