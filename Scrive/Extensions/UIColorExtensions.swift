//
//  UIColorExtensions.swift
//  Created by Srikanth on 01/01/23

import Foundation
import UIKit

extension UIColor {
    /*000000*/ static let blackColor = UIColor(named: "BlackColor") ?? UIColor.gray
    /*FFFFFF*/ static let whiteColor = UIColor(named: "WhiteColor") ?? UIColor.gray
    /*FAF8F1*/ static let backgroundColor = UIColor(named: "BackgroundColor") ?? UIColor.gray
}

extension UIColor {
    public convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    static var randomColor: UIColor {
        let r:CGFloat  = .random(in: 0...1)
        let g:CGFloat  = .random(in: 0...1)
        let b:CGFloat  = .random(in: 0...1)
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    static func hexStringToUIColor(WithHexStr hexStr: String, WithAlphaValue alphaValue: CGFloat = 1.0) -> UIColor {
        var cString:String = hexStr.trimSpaces
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alphaValue)
        )
    }
}
