//
//  AppFont.swift
//  Created by Srikanth on 01/01/23

import UIKit

private let familyName = "ProximaNova"

enum AppFont: String {
    case regular = "Regular"

    func size(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: fullFontName, size: size) {
            return font
        }
        fatalError("Font '\(fullFontName)' does not exist.")
    }
    
    private var fullFontName: String {
        return rawValue.isEmpty ? familyName : familyName + "-" + rawValue
    }
}
