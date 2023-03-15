//
//  UITableViewExtensions.swift
//  Created by Srikanth on 03/04/22.

import UIKit

extension UITableView {
    func setNoDataView(WithImageName imgName: String = "", WithTitleStr titleStr: String) {
        let bgView = UIView()
        bgView.frame = CGRect(x: 0, y: 0, width: (self.bounds.size.width), height: (self.bounds.size.height))
        bgView.backgroundColor = .clear
        self.backgroundView = bgView
        
        let noDataView: NoDataView = NoDataView()
        noDataView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        bgView.addSubview(noDataView)
        noDataView.center = bgView.center
        
        noDataView.updateViewWithData(WithImageName: imgName, WithTitleStr: titleStr)
        self.backgroundView?.isHidden = true
    }
    
    func showNoDataView() {
        if let view = self.backgroundView {
            view.isHidden = false
        }
    }
    
    func hideNoDataView() {
        if let view = self.backgroundView {
            view.isHidden = true
        }
    }
}

extension UITableView {
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .none
    }
}
