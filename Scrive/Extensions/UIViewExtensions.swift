//
//  UIViewExtensions.swift
//  Created by Srikanth on 01/01/23

import UIKit

@IBDesignable extension UIView {
    @IBInspectable var iCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = (newValue > 0)
        }
    }
    
    @IBInspectable var iCircleView:Bool {
        get {
            return layer.cornerRadius == min(self.frame.width, self.frame.height) / CGFloat(2.0) ? true : false
        }
        set {
            if newValue {
                layer.cornerRadius = min(self.frame.width, self.frame.height) / CGFloat(2.0)
                layer.masksToBounds = true
            }
            else{
                layer.cornerRadius = 0.0
                layer.masksToBounds = false
            }
        }
    }
    
    @IBInspectable var iBorderColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var iBorderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var topCorners: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        }
    }
    
    @IBInspectable var bottomCorners: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        }
    }
}

// MARK: Shadows And Rounded Corners won't work at the same time use CustomView class to work both at the same time
@IBDesignable extension UIView {
    @IBInspectable var iShadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var iShadowOpacity: CGFloat {
        get {
            return CGFloat(layer.shadowOpacity)
        }
        set {
            layer.shadowOpacity = Float(newValue)
        }
    }
    
    @IBInspectable var iShadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var iShadowColor: UIColor? {
        get {
            guard let cgColor = layer.shadowColor else {
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
}

// MARK: Frames, positions, sizes
extension UIView {
    var getWidth: CGFloat {
        return self.frame.size.width
    }
    
    var getHeight: CGFloat {
        return self.frame.size.height
    }
    
    var getMinX: CGFloat {
        return self.frame.minX
    }
    
    var getMaxX: CGFloat {
        return self.frame.maxX
    }
    
    var getMinY: CGFloat {
        return self.frame.minY
    }
    
    var getMaxY: CGFloat {
        return self.frame.maxY
    }
    
    var getCenterX: CGFloat {
        return self.center.x
    }
    
    var getCenterY: CGFloat {
        return self.center.y
    }
    
    var topSafeArea: CGFloat {
        return self.safeAreaInsets.top
    }
    
    var bottomSafeArea: CGFloat {
        return self.safeAreaInsets.bottom
    }
}
