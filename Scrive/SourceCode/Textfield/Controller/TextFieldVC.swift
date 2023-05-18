//
//  TextFieldVC.swift
//  Created by Srikanth on 15/03/23.

import UIKit

class TextFieldVC: BaseViewController {
    @IBOutlet weak var topBar: TopBar!
    
    @IBOutlet weak var usernameTxtFld: UITextField!
    @IBOutlet weak var pwdTxtFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    private func setupVC() {
        setupTopBar()
        setupTextFields()
    }
}

// MARK: Topbar
extension TextFieldVC {
    private func setupTopBar() {
        topBar.updateTopBarTitle(WithLeftImage: "LeftArrow", WithTitleStr: "TextField")
        topBar.backBtnTapped = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: UITextFieldDelegate
extension TextFieldVC: UITextFieldDelegate {
    private func setupTextFields() {
        [usernameTxtFld, pwdTxtFld].forEach {
            $0.delegate = self
            $0.autocapitalizationType  = .sentences
            $0.autocorrectionType  = .no
            $0.smartDashesType  = .no
            $0.smartInsertDeleteType  = .no
            $0.smartQuotesType  = .no
            $0.spellCheckingType  = .no
            $0.keyboardType = .default
            $0.returnKeyType = .go
            $0.tintColor = .bgColor
        }
        
        pwdTxtFld.isSecureTextEntry = true
        pwdTxtFld.enablePasswordToggle()
        
        updateTextfieldSpacing()
    }
    
    private func updateTextfieldSpacing() {
        usernameTxtFld.setAttributedStr(WithSpacing: 3)
        pwdTxtFld.setAttributedStr(WithSpacing: 3)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.location == 0 && (string == " ") {
            return false
        } else {
            let resultantString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string.lowercased()
            let formattedString = resultantString.trimmingCharacters(in: CharacterSet.whitespaces)
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
}
