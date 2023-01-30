//
//  ProgressHUD.swift
//  Created by Srikanth on 01/01/23

import UIKit
import MBProgressHUD

private var progressHUD: MBProgressHUD?

extension UIViewController {
    func showProgressHUD(message:String? = nil) {
        view.endEditing(true)
        hideProgressHUD()
        progressHUD = nil
        progressHUD = MBProgressHUD.showAdded(to: view, animated: true)
        
        if let message = message {
            progressHUD?.label.text = message
            progressHUD?.label.numberOfLines = 0
        }
    }
    
    func hideProgressHUD() {
        if let progressHUD = progressHUD {
            progressHUD.hide(animated: true)
        }
    }
}
