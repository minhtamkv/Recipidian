//
//  AppCoordinator.swift
//  Ricipidian
//
//  Created by Minh Tâm on 23/03/2021.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    var window: UIWindow?

    init(window: UIWindow? = GlobalData.shared.window) {
        self.window = window
        super.init()
    }

    override func start() {
        let mainCoordinator: IMainTabBarCoordinator = MainTabBarCoordinator(navigation)
        coordinate(to: mainCoordinator)

        window?.rootViewController = mainCoordinator.navigation
        window?.makeKeyAndVisible()
    }
}
