//
//  StringExtensions.swift
//  Scrive
//
//  Created by Scrive on 01/01/22.
//

import UIKit

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

    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    func getMutableAttributedString(WithColor foregroundColor: UIColor, WithFont font: UIFont, ForString str: String) -> NSMutableAttributedString {
        let attributes = [NSAttributedString.Key.foregroundColor: foregroundColor, NSAttributedString.Key.font: font]
        let mutableAttributedString = NSMutableAttributedString(string: str, attributes: attributes)
        return mutableAttributedString
    }
}
