//
//  UICollectionViewExtension.swift
//  Created by Srikanth on 03/04/22.

import UIKit

extension UICollectionView {
    func setNoDataView(WithErrorImage errImg: String? = nil, WithErrorStr errStr: String) {
        let noDataView = NoDataView()
        noDataView.frame = self.backgroundView?.frame ?? .zero
        self.backgroundView = noDataView
        noDataView.updateViewWithData(WithImageName: errImg!, WithTitleStr: errStr)
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

extension UICollectionView {
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel
    }
    
    func restore() {
        self.backgroundView = nil
    }
}
