//
//  UserDefaultsHelper.swift
//  Scrive
//
//  Created by Scrive on 01/01/22.
//

import Foundation

enum UserDefaultKeys: String, CaseIterable {
 case deviceToken
 case userName
 case password
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
 UserDefaultsHelper.setData(value: "user-001", key: .deviceToken)
 UserDefaultsHelper.setData(value: true, key: .userName)
 UserDefaultsHelper.setData(value: 123, key: .password)
 
 
 $$$-get data
 let id = UserDefaultsHelper.getData(type: String.self, forKey: .deviceToken)
 let userType = UserDefaultsHelper.getData(type: Bool.self, forKey: .userName)
 let code = UserDefaultsHelper.getData(type: Int.self, forKey: .password)
 
 
 $$$-clear data
 UserDefaultsHelper.removeData(key: .deviceToken)
 ************************************************************************************************
 */
