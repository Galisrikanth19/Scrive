//
//  SubMenuData.swift
//  Created by Srikanth on 01/02/24.

import Foundation

enum SubMenuType: String {
    case normal = "Normal"
    case expandable = "Expandable"
}

struct SubMenuModel {
    let subMenu: SubMenuType?
}

struct SubMenuData {
    static let subMenuModelArr: [SubMenuModel] = [
        SubMenuModel(subMenu: .normal),
        SubMenuModel(subMenu: .expandable)
    ]
}
