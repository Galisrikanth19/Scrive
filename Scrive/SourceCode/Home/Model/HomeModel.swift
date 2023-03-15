//
//  HomeModel.swift
//  Created by Srikanth on 15/03/23.

import Foundation

struct HomeModel {
    let titleStr: String?
}

struct HomeListData {
    static let homeModelArr: [HomeModel] = [
        HomeModel(titleStr: "Tableview"),
        HomeModel(titleStr: "CollectionView"),
        HomeModel(titleStr: "Button"),
        HomeModel(titleStr: "Label")
    ]
}
