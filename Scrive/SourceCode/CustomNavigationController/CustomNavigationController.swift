//
//  CustomNavigationController.swift
//  Created by Srikanth on 01/01/23

import UIKit

class CustomNavigationController: UINavigationController {
    override var childForStatusBarStyle: UIViewController? {
        return visibleViewController
    }
    
    override var childForStatusBarHidden: UIViewController? {
            return visibleViewController
    }
}

/*
 Usage sourceCode inside UIViewcontroller
 ************************************************************************************************
 var isDarkContentBackground = false
 
@IBAction func lightBtnClicked(_ sender: Any) {
    isDarkContentBackground = true
    setNeedsStatusBarAppearanceUpdate()
}

@IBAction func darkBtnClicked(_ sender: Any) {
    isDarkContentBackground = false
    setNeedsStatusBarAppearanceUpdate()
}

override var preferredStatusBarStyle: UIStatusBarStyle {
    if isDarkContentBackground {
        return .lightContent
    } else {
        return .darkContent
    }
}

override var prefersStatusBarHidden: Bool {
    if isDarkContentBackground {
        return true
    } else {
        return false
    }
}
************************************************************************************************
*/
