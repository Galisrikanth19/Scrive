//
//  UITextFieldExtensions.swift
//  Created by Srikanth on 01/01/23

import UIKit

@IBDesignable
extension UITextField {
    @IBInspectable var leftPadding: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
    
    @IBInspectable var rightPadding: CGFloat {
        get {
            return rightView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            rightView = paddingView
            rightViewMode = .always
        }
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
    func setAttributedStr(WithSpacing spacing: CGFloat) {
        let attributedString = NSMutableAttributedString(string: (self.text ?? ""))
        attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSRange(location: 0, length: attributedString.length))
        self.attributedText = attributedString
    }
}

extension UITextField {
    func enablePasswordToggle() {
        let paddingView = UIView(frame: CGRect(x: (self.getWidth - 40), y: 0, width: 40, height: self.getHeight))
        let button = UIButton(type: .custom)
        
        button.frame = CGRect(x: 10, y: 5, width: 20, height: 20)
        setPasswordToggleImage(button)
        button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
        paddingView.addSubview(button)
        button.center.y = paddingView.center.y
        
        rightView = paddingView
        self.rightViewMode = .always
    }
    
    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        if isSecureTextEntry {
            button.setImage(UIImage(named: "EyeClose"), for: .normal)
        } else {
            button.setImage(UIImage(named: "EyeOpen"), for: .normal)
        }
    }
    
    @IBAction func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender as! UIButton)
    }
}
