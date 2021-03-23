//
//  GlobalData.swift
//  Ricipidian
//
//  Created by Minh Tâm on 23/03/2021.
//

import RxCocoa
import RxSwift
import UIKit

class GlobalData {
    static let shared = GlobalData()

    private init() {
    }

    // MAåRK: - RootView
    var window: UIWindow?
    var mainTabbar: MainTabBarController?

    func setRootView(_ rootViewController: UIViewController) {
        window?.rootViewController = rootViewController
    }

    func setDefaultTabbar(_ index: Int) {
        mainTabbar?.tabBar.isHidden = false
        mainTabbar?.selectedIndex = index
    }
}
