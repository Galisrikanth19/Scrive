//
//  DoubleExtensions.swift
//  Created by Srikanth on 12/12/23.

import Foundation

extension Double {
    var doubleSpecifier: String {
        String(format: "%.2f", self)
    }
    
    var dollarString:String {
        if self == 0 {
            return "$00.00"
        }
        return String(format: "$%.2f", self)
    }
}
