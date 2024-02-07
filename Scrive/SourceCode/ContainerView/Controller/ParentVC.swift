//
//  ParentVC.swift
//  Created by Srikanth on 19/10/23.

import UIKit

class ParentVC: BaseViewController {
    @IBOutlet weak var topBar: TopBar!
    
    private var childVC: ChildVC?
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        if identifier == ChildVC.className {
            childVC = segue.destination as? ChildVC
        }
        allClosures()
    }
}

// MARK: CustomizeScreen
extension ParentVC {
    private func setupVC() {
        setupTopBar()
    }
}

// MARK: Topbar
extension ParentVC {
    private func setupTopBar() {
        topBar.updateTopBarTitle(WithLeftImage: "LeftArrow", WithTitleStr: "ContainerView")
        topBar.backBtnTapped = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: IBActions
extension ParentVC {
    @IBAction func updateChildVCWithData(_ sender: UIButton) {
        childVC?.loadViewWithData(WithData: "This is triggered from parent")
    }
}

// MARK: ChildVC AllClosures
extension ParentVC {
    private func allClosures() {
        childVC?.didClickedOnChildVCCallBack = { [weak self] () in
            guard let strongSelf = self else { return }
            strongSelf.showToast(WithMessage: "Call back from ChildVC")
        }
    }
}
