//
//  RestAPIVC.swift
//  Created by Webappclouds on 14/08/23.

import UIKit

class RestAPIVC: BaseViewController {
    @IBOutlet weak var topBar: TopBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    private func setupVC() {
        setupTopBar()
    }
}

// MARK: IBActions
extension RestAPIVC {
    @IBAction func loginRequest(_ sender: UIButton) {
        loginRequest()
    }
}

// MARK: Topbar
extension RestAPIVC {
    private func setupTopBar() {
        topBar.updateTopBarTitle(WithLeftImage: "LeftArrow", WithTitleStr: "RestAPIs")
        topBar.backBtnTapped = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: RestApis
extension RestAPIVC {
    private func loginRequest() {
        let parameters: Dictionary<String, Any> = ["userName" : "dina12@gmail.com",
                                                   "password" : "1234",
                                                   "Pushtoken": ""]
        
        ApiActions.common.loginRequest(WithParameters: parameters) { [weak self] (resData) in
            guard let strongSelf = self else { return }
            strongSelf.hideProgressHUD()
        } WithSuccessCallback: { [weak self] (resM) in
            guard let strongSelf = self, let resM = resM else { return }
            if resM.status == true {
                strongSelf.showToast(WithMessage: (resM.message ?? ""))
            } else {
                strongSelf.showErrorToast(WithMessage: (resM.message ?? ""))
            }
        } WithFailureCallback: { [weak self] (errMsg) in
            guard let strongSelf = self, let errMsg = errMsg else { return }
            strongSelf.showErrorToast(WithMessage: errMsg)
        }
    }
}
