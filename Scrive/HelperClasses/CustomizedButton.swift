//
//  CustomizedButton.swift
//  Created by Srikanth on 01/02/24.

import UIKit

@IBDesignable
class CustomizedButton: UIButton {
@IBInspectable var cornerRadius: CGFloat = 8.0 {
        didSet {
            setNeedsLayout()
        }
    }

    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            setNeedsLayout()
        }
    }

    @IBInspectable var borderColor: UIColor = UIColor.black {
        didSet {
            setNeedsLayout()
        }
    }

    @IBInspectable var shadowColor: UIColor = UIColor.red {
        didSet {
            setNeedsLayout()
        }
    }

    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet {
            setNeedsLayout()
        }
    }

    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 0.0) {
        didSet {
            setNeedsLayout()
        }
    }

    @IBInspectable var shadowRadius: CGFloat = 20.0 {
        didSet {
            setNeedsLayout()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    private func setupButton() {
        clipsToBounds = false
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateAppearance()
    }

    private func updateAppearance() {
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)

        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor

        layer.shadowPath = path.cgPath
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
    }
}
