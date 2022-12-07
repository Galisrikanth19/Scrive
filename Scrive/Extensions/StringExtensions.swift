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
}
