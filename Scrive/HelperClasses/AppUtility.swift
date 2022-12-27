//
//  AppUtility.swift
//  Scrive
//
//  Created by Webappclouds on 27/12/22.
//

import UIKit

struct AppUtility {
    static func getFontsList() {
        for family in UIFont.familyNames {
            let sName: String = family as String
            print("family: \(sName)")
            
            for name in UIFont.fontNames(forFamilyName: sName) {
                print("name: \(name as String)")
            }
        }
    }
}
