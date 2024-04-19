//
//  StringExtensions.swift
//  Created by Srikanth on 01/01/23

import UIKit

// MARK: Basic
extension String {
    var length: Int {
        return self.count
    }
    
    var hasValue: Bool {
        if (self.trimSpaces).isEmpty {
            return false
        } else {
            return true
        }
    }
    
    var trimSpaces: String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
    }
}

// MARK: Html attributed string
extension String {
    func htmlAttributed() -> NSAttributedString? {
        guard let data = self.data(using: .utf8) else { return nil }
        do {
            let font = UIFont.italicSystemFont(ofSize: 16)
            let attributedString = try NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
            attributedString.addAttribute(.font, value: font, range: NSRange(location: 0, length: attributedString.length))
            return attributedString
        } catch {
            print("Error converting HTML string to attributed string:", error)
            return nil
        }
    }
}

// MARK: Attributed String
extension String {
    func getMutableAttributedString(WithColor foregroundColor: UIColor, WithFont font: UIFont, ForString str: String) -> NSMutableAttributedString {
        let attributes = [NSAttributedString.Key.foregroundColor: foregroundColor, NSAttributedString.Key.font: font]
        let mutableAttributedString = NSMutableAttributedString(string: str, attributes: attributes)
        return mutableAttributedString
    }
}
