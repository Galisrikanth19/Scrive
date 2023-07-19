//
//  EnumVC.swift
//  Created by Srikanth on 19/05/23.

import UIKit

class EnumVC: BaseViewController {
    @IBOutlet weak var topBar: TopBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    private func setupVC() {
        setupTopBar()
        
        moveToDirection(WithCompassPoint: .east)
        rawValues()
        caseIterable()
        associatedValues()
    }
    
    private func moveToDirection(WithCompassPoint compassPoint: CompassPoint) {
        switch compassPoint {
            case .north:
                print("Lots of planets have a north")
            case .south:
                print("Watch out for penguins")
            case .east:
                print("Where the sun rises")
            case .west:
                print("Where the skies are blue")
        }
    }
    
    private func rawValues() {
        let earthsOrder = Planet.earth.rawValue
        print("Earths order is \(earthsOrder)")
        
        let positionToFind = 7
        if let somePlanet = Planet(rawValue: positionToFind) {
            switch somePlanet {
                case .earth:
                    print("Mostly harmless")
                case .uranus:
                    print("White planet")
                default:
                    print("Not a safe place for humans")
            }
        } else {
            print("There isn't a planet at position \(positionToFind)")
        }
    }
    
    private func caseIterable() {
        let numberOfChoices = Beverage.allCases.count
        print("\(numberOfChoices) beverages available")
        
        for beverage in Beverage.allCases {
            print(beverage)
        }
    }
    
    private func associatedValues() {
        var productBarcode = Barcode.upc(8, 85909, 51226, 3)
        productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
        
        switch productBarcode {
            case .upc(let numberSystem, let manufacturer, let product, let check):
                print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
            case .qrCode(let productCode):
                print("QR code: \(productCode).")
        }
    }
}

// MARK: Topbar
extension EnumVC {
    private func setupTopBar() {
        topBar.updateTopBarTitle(WithLeftImage: "LeftArrow", WithTitleStr: "Enum")
        topBar.backBtnTapped = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.navigationController?.popViewController(animated: true)
        }
    }
}
