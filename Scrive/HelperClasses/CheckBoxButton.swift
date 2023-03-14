//
//  CheckBoxButton.swift
//  Created by Srikanth on 10/03/23.

import UIKit

class CheckBoxButton: UIButton {
    let checkedImage: UIImage! = UIImage(named: "CheckedCheckbox")
    let uncheckedImage: UIImage! = UIImage(named: "UncheckedCheckbox")
    
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
        
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
        
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
