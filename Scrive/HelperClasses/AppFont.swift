//
//  AppFont.swift
//
//  Created by Webappclouds on 10/26/22.
//

import Foundation
import UIKit

private let familyName = "ProximaNova"

enum AppFont: String {
    case regular = "Regular"
    case medium = "Medium"
    case semiBold = "SemiBold"
    case bold = "Bold"
    case light = "Light"

    func size(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: fullFontName, size: size) {
            return font
        }
        fatalError("Font '\(fullFontName)' does not exist.")
    }
    
    fileprivate var fullFontName: String {
        return rawValue.isEmpty ? familyName : familyName + "-" + rawValue
    }
}
