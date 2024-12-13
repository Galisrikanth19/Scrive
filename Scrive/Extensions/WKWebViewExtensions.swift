//
//  WKWebViewExtensions.swift
//  Created by Srikanth on 01/01/23

import UIKit
import WebKit

extension WKWebView {
    func load(WithUrlStr urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}
