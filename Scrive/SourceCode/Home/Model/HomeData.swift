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
    case containerView = "ContainerView"
    case calendarView = "CalendarView"
    case locationView = "LocationView"
    case htmlView = "HtmlView"
    case randomJsonView = "RandomJsonView"
}

struct HomeModel {
    let menu: MenuType?
}

struct HomeData {
    static let homeModelArr: [HomeModel] = [
        HomeModel(menu: .tableview),
        HomeModel(menu: .collectionView),
        HomeModel(menu: .button),
        HomeModel(menu: .label),
        HomeModel(menu: .textfeild),
        HomeModel(menu: .checkbox),
        HomeModel(menu: .enums),
        HomeModel(menu: .scrollView),
        HomeModel(menu: .restApi),
        HomeModel(menu: .containerView),
        HomeModel(menu: .calendarView),
        HomeModel(menu: .locationView),
        HomeModel(menu: .htmlView),
        HomeModel(menu: .randomJsonView)
    ]
}
