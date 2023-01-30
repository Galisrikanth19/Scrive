//
//  Swizzle.swift
//  Created by Srikanth on 01/01/23

import UIKit

extension UIViewController {
    @objc func _tracked_viewWillAppear(_ animated: Bool) {
        print("Tracked this screen:---- \(type(of: self))")
        _tracked_viewWillAppear(animated)
    }
    
    static func swizzle() {
        let originalSelector = #selector(UIViewController.viewDidLoad)
        let swizzledSelector = #selector(UIViewController._tracked_viewWillAppear(_:))
        let originalMethod = class_getInstanceMethod(self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        method_exchangeImplementations(originalMethod!, swizzledMethod!)
    }
}
