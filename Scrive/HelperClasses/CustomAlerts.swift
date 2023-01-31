//
//  CustomAlerts.swift
//  Created by Srikanth on 01/01/23

import UIKit
import Toast_Swift

extension UIViewController {
    func showToast(WithMessage message:String)  {
        var style = ToastManager.shared.style
        style.backgroundColor = UIColor.green
        style.messageColor = UIColor.black
        self.navigationController?.view.makeToast(message, duration: 2.0, position: .top, style:style)
    }
    
    func showErrorToast(WithMessage message:String)  {
        var style = ToastManager.shared.style
        style.backgroundColor = UIColor.red
        style.messageColor = UIColor.black
        self.navigationController?.view.makeToast(message, duration: 2.0, position: .top, style:style)
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message:String? = nil, okCallback:@escaping () -> Void) {
        let alertController = UIAlertController(title: title, message: message ?? "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { (_ ) in
            okCallback()
        })
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showAlertContinueCancel(title: String, message:String? = nil, okCallback:@escaping () -> Void) {
        let alertController = UIAlertController(title: title, message: message ?? "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { (_ ) in
            okCallback()
        })
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alertController.addAction(cancel)
        alertController.addAction(action)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
