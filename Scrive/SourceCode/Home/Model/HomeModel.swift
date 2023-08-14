//
//  HomeModel.swift
//  Created by Srikanth on 15/03/23.

import Foundation

enum MenuType: String {
    case tableview = "Tableview"
    case collectionView = "CollectionView"
    case button = "Button"
    case label = "Label"
    case textfeild = "Textfeild"
    case checkbox = "Checkbox"
    case enums = "Enum"
    case scrollView = "ScrollView"
    case restApi = "RestAPI"
}

struct HomeModel {
    let menu: MenuType?
}

struct HomeModelData {
    static let homeModelArr: [HomeModel] = [
        HomeModel(menu: .tableview),
        HomeModel(menu: .collectionView),
        HomeModel(menu: .button),
        HomeModel(menu: .label),
        HomeModel(menu: .textfeild),
        HomeModel(menu: .checkbox),
        HomeModel(menu: .enums),
        HomeModel(menu: .scrollView),
        HomeModel(menu: .restApi)
    ]
}
