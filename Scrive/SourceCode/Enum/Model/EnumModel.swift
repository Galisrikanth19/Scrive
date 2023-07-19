//
//  EnumModel.swift
//  Created by Srikanth on 29/06/23.

import Foundation

enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum Beverage: CaseIterable {
    case coffee, tea, juice
}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
