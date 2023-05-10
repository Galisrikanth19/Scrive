//
//  UIViewControllerExtensions.swift
//  Created by Srikanth on 01/01/23

import UIKit
extension UIViewController {
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
