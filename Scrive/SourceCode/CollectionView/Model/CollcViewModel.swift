//
//  CollcViewModel.swift
//  Created by Srikanth on 15/12/22.

import Foundation

struct CollcViewModel {
    let title: String?
    let imgName: String?
}

struct CollcViewModelData {
    static let collcViewModelArr: [CollcViewModel] = [
        CollcViewModel(title: "Srikanth", imgName: "Srikanth"),
        CollcViewModel(title: "Sagarika", imgName: "Sagarika"),
        CollcViewModel(title: "Saanvi", imgName: "Saanvi"),
        CollcViewModel(title: "RaviShaker", imgName: "RaviShaker"),
        CollcViewModel(title: "Sujatha", imgName: "Sujatha"),
        CollcViewModel(title: "Bairaiah", imgName: "Bairaiah")
    ]
}
