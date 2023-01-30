//
//  HomeVC.swift
//  Created by Srikanth on 01/01/23

import UIKit

class HomeVC: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func webView(_ sender: Any) {
//        let vc = UIStoryboard.init(name: "WKWebSB", bundle: Bundle.main).instantiateViewController(withIdentifier: "WKWebVC") as? WKWebVC
//        self.navigationController?.pushViewController(vc!, animated: true)
        self.showErrorToast(WithMessage: "Hello srikanth")
    }
}
