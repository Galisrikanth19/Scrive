//
//  ChildVC.swift
//  Created by Srikanth on 19/10/23.

import UIKit

class ChildVC: BaseViewController {
    var didClickedOnChildVCCallBack: (()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: IBActions
extension ChildVC {
    @IBAction func fireBtnClicked(_ sender: UIButton) {
        didClickedOnChildVCCallBack?()
    }
}

//MARK: LoadData
extension ChildVC {
    func loadViewWithData(WithData data: String) {
        print(data)
    }
}
