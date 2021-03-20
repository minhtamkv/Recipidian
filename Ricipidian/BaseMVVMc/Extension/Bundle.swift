//
//  Bundle.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import UIKit

extension Bundle {
    var appVersion: String? {
        infoDictionary?["CFBundleShortVersionString"] as? String
    }

    static var mainAppVersion: String? {
        Bundle.main.appVersion
    }
}
