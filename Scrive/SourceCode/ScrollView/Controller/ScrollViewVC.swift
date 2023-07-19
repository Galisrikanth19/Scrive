//
//  ScrollViewVC.swift
//  Created by Srikanth on 15/03/23.

import UIKit

class ScrollViewVC: BaseViewController {
    @IBOutlet weak var topBar: TopBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    private func setupVC() {
        setupTopBar()
    }
}

// MARK: Topbar
extension ScrollViewVC {
    private func setupTopBar() {
        topBar.updateTopBarTitle(WithLeftImage: "LeftArrow", WithTitleStr: "ScrollView")
        topBar.backBtnTapped = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.navigationController?.popViewController(animated: true)
        }
    }
}
