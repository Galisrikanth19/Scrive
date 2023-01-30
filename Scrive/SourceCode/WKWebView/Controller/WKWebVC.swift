//
//  WKWebVC.swift
//  Created by Srikanth on 01/01/23

import UIKit
import WebKit

class WKWebVC: BaseViewController {
    @IBOutlet weak var webView: WKWebView!
    var wkWebM: WKWebModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    private func setupVC() {
        invokeWebView()
    }
}

// MARK: WKNavigationDelegate
extension WKWebVC: WKNavigationDelegate {
    private func invokeWebView() {
        self.showProgressHUD(message: "")
        webView.navigationDelegate = self
        webView.load(wkWebM?.urlStr ?? "")
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let _ = navigationAction.request.url?.host {
            decisionHandler(.allow)
            return
        }
        decisionHandler(.cancel)
    }
   
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.hideProgressHUD()
        }
    }
}
