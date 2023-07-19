//
//  BaseViewController.swift
//  Created by Srikanth on 01/01/23

import UIKit

class BaseViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    private func setupVC() {
        self.navigationController?.navigationBar.isHidden = true
        hideKeyboardOnTapView()
        setupScrollview()
    }
    
    private func setupScrollview() {
        if let scrollView = scrollView {
            scrollView.contentInsetAdjustmentBehavior = .never
        }
    }
}

// MARK: UIGestureRecognizerDelegate
extension BaseViewController: UIGestureRecognizerDelegate {
    private func hideKeyboardOnTapView() {
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        (touch.view is UIButton) ? false : true
    }
}
