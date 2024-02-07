//
//  CheckBoxVC.swift
//  Created by Srikanth on 18/05/23.

import UIKit

class CheckBoxVC: BaseViewController {
    @IBOutlet weak var topBar: TopBar!
    @IBOutlet weak var chkBoxBtn: CheckBoxButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
}

// MARK: CustomizeScreen
extension CheckBoxVC {
    private func setupVC() {
        setupTopBar()
        setCheckBox()
    }
    
    private func setCheckBox() {
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

// MARK: Topbar
extension CheckBoxVC {
    private func setupTopBar() {
        topBar.updateTopBarTitle(WithLeftImage: "LeftArrow", WithTitleStr: "CheckBox")
        topBar.backBtnTapped = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.navigationController?.popViewController(animated: true)
        }
    }
}
