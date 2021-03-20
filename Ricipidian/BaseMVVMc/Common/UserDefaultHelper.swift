//
//  UserDefaultHelper.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import UIKit

class UserDefaultHelper: NSObject {
    public static var sharedInstance = {
        return UserDefaultHelper()
    }()

    func setValueString(key: String, value: String) {
        UserDefaults.standard.set(value, forKey: key)
    }

    func getValueStringByKey(key: String) -> String {
        return UserDefaults.standard.string(forKey: key) ?? ""
    }

    func setValueBool(key: String, value: Bool) {
        UserDefaults.standard.set(value, forKey: key)
    }

    func getValueBoolByKey(key: String) -> Bool {
        return UserDefaults.standard.bool(forKey: key)
    }

    func setValueObject(key: String, value: Any) {
        UserDefaults.standard.set(value, forKey: key)
    }

    func getObjectByKey(key: String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }

    func getValueArrayString(key: String) -> [String]? {
        return UserDefaults.standard.stringArray(forKey: key)
    }
}

struct KeyUserDefaults {
    static let keyAccessToken = "AccessToken"
    static let keyUsername = "Username"
    static let keyLanguage = "Language"
    static let keyUseBiometric = "keyUseBiometric"
    static let keyInfoUser = "keyUseBiometric"
    static let keyRefreshToken = "keyRefreshToken"
}
