//
//  UserDefaultsHelper.swift
//  Scrive
//
//  Created by Scrive on 01/01/22.
//

import Foundation

enum UserDefaultKeys: String, CaseIterable {
 case userId
 case isAdmin
 case pinCode
}

struct UserDefaultsHelper {
    static func setData<T>(value: T, key: UserDefaultKeys) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key.rawValue)
    }
    
    static func getData<T>(type: T.Type, forKey: UserDefaultKeys) -> T? {
        let defaults = UserDefaults.standard
        let value = defaults.object(forKey: forKey.rawValue) as? T
        return value
    }
    
    static func removeData(key: UserDefaultKeys) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key.rawValue)
    }
}


/*
 ************************************************************************************************
 $$$-save data
 UserDefaultsHelper.setData(value: "user-001", key: .userId)
 UserDefaultsHelper.setData(value: true, key: .isAdmin)
 UserDefaultsHelper.setData(value: 123, key: .pinCode)
 
 
 $$$-get data
 let id = UserDefaultsHelper.getData(type: String.self, forKey: .userId)
 let userType = UserDefaultsHelper.getData(type: Bool.self, forKey: .isAdmin)
 let code = UserDefaultsHelper.getData(type: Int.self, forKey: .pinCode)
 
 
 $$$-clear data
 UserDefaultsHelper.removeData(key: .userId)
 ************************************************************************************************
 */
