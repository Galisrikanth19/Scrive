//
//  AppFont.swift
//  Created by Srikanth on 01/01/23

import UIKit

enum AppFont: String {
    case poppinsRegular = "Poppins-Regular"

    func size(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: rawValue, size: size) {
            return font
        }
        return UIFont.systemFont(ofSize: 50)
    }
}

/*
 Usage sourceCode
************************************************************************************************
    self.titleLbl.font = AppFont.poppinsRegular.size(16)
************************************************************************************************
*/
