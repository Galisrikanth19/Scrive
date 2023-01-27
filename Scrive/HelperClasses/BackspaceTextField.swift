//
//  BackspaceTextField.swift
//  Created by Srikanth on 01/01/23

import UIKit

protocol BackspaceTextFieldDelegate: AnyObject {
    func textFieldDidEnterBackspace(_ textField: BackspaceTextField)
}

class BackspaceTextField: UITextField {
    weak var backspaceTextFieldDelegate: BackspaceTextFieldDelegate?

    override func deleteBackward() {
        if text?.isEmpty ?? false {
            backspaceTextFieldDelegate?.textFieldDidEnterBackspace(self)
        }
        super.deleteBackward()
    }
}

/*
 Usage sourceCode
************************************************************************************************
 txtFld.backspaceTextFieldDelegate = self
 
 func textFieldDidEnterBackspace(_ textField: BackspaceTextField) {
    guard let index = textFieldsArr.firstIndex(of: textField) else {
        return
    }
    if index > 0 {
        textFieldsArr[index - 1].becomeFirstResponder()
    }
 }
 ************************************************************************************************
 */
