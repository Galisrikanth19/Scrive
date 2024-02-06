//
//  ExpandableData.swift
//  Created by Srikanth on 01/02/24.

import Foundation

struct ExpandableData {
    static let dataArr: [SectionModel] = [
        SectionModel(isOpened: false,
                     title: "Huntingdon",
                     rowsArr: [RowModel(title: "arun"),
                               RowModel(title: "rajesh"),
                               RowModel(title: "moorthy")]
                    ),
        
        SectionModel(isOpened: false,
                     title: "Shelton",
                     rowsArr: [RowModel(title: "priya"),
                               RowModel(title: "Sundar"),
                               RowModel(title: "Kavitha")]
                    ),
        
        SectionModel(isOpened: false,
                     title: "Tuskegee",
                     rowsArr: [RowModel(title: "Gowri"),
                               RowModel(title: "Ram"),
                               RowModel(title: "Murugan")]
                    )
    ]
}
