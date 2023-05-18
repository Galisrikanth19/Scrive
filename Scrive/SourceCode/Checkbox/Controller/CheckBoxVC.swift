//
//  CheckBoxVC.swift
//  Created by Srikanth on 18/05/23.

import UIKit

class CheckBoxVC: BaseViewController {
    @IBOutlet weak var chkBoxBtn: CheckBoxButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    private func setupVC() {
        chkBoxBtn.backgroundColor = .clear
        chkBoxBtn.chkBoxBtnStateUpdated = { [weak self] in
            guard let strongSelf = self else { return }
            
            if strongSelf.chkBoxBtn.isChecked {
                strongSelf.showToast(WithMessage: "Checkbox is checked")
            } else {
                strongSelf.showToast(WithMessage: "Checkbox is unchecked")
            }
        }
    }
}
