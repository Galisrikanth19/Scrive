//
//  NSObjectExtensions.swift
//  Created by Srikanth on 01/01/23

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
