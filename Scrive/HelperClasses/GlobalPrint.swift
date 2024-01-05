//
//  GlobalPrint.swift
//  Created by Srikanth on 01/01/23

// MARK: - Once you develop an app, you should take care of that all print statements should only be executed in debug mode, not in release mode. Otherwise, they will slow down the app. The reason is that every print() function takes time to print output on the console. Keep attention to do not use print() statements in release mode.

import Foundation

public func print(_ object: Any) {
    #if DEBUG
        Swift.print(object)
    #endif
}

public func print(_ object: Any...) {
    #if DEBUG
        for item in object {
            Swift.print(item)
        }
    #endif
}
