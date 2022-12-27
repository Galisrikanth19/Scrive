//
//  UIButtonExtensions.swift
//  Scrive
//
//  Created by Scrive on 01/01/22.
//

import UIKit

extension UIButton {
    @IBInspectable
    var letterSpacing: CGFloat {
        set {
            let attributedString: NSMutableAttributedString
            if let currentAttrString = attributedTitle(for: .normal) {
                attributedString = NSMutableAttributedString(attributedString: currentAttrString)
            } else {
                attributedString = NSMutableAttributedString(string: self.title(for: .normal) ?? "")
                setTitle(.none, for: .normal)
            }

            attributedString.addAttribute(NSAttributedString.Key.kern, value: newValue, range: NSRange(location: 0, length: attributedString.length))
            setAttributedTitle(attributedString, for: .normal)
        }
        get {
            if let currentLetterSpace = attributedTitle(for: .normal)?.attribute(NSAttributedString.Key.kern, at: 0, effectiveRange: .none) as? CGFloat {
                return currentLetterSpace
            } else {
                return 0
            }
        }
    }
    
    @IBInspectable
    var underline: Bool {
        set {
            let attributedString: NSMutableAttributedString
            if let currentAttrString = attributedTitle(for: .normal) {
                attributedString = NSMutableAttributedString(attributedString: currentAttrString)
            } else {
                attributedString = NSMutableAttributedString(string: self.title(for: .normal) ?? "")
                setTitle(.none, for: .normal)
            }

            attributedString.addAttribute(.underlineStyle,
                                                value: NSUnderlineStyle.single.rawValue,
                                                range: NSRange(location: 0, length: attributedString.length))
            setAttributedTitle(attributedString, for: .normal)
        }
        get {
            return false
        }
    }
    
    func shake() {
        let shake           = CABasicAnimation(keyPath: "position")
        shake.duration      = 0.1
        shake.repeatCount   = 2
        shake.autoreverses  = true
        
        let fromPoint       = CGPoint(x: center.x - 8, y: center.y)
        let fromValue       = NSValue(cgPoint: fromPoint)
        
        let toPoint         = CGPoint(x: center.x + 8, y: center.y)
        let toValue         = NSValue(cgPoint: toPoint)
        
        shake.fromValue     = fromValue
        shake.toValue       = toValue
        
        layer.add(shake, forKey: "position")
    }
}
