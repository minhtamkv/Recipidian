//
//  MainTabbarViewController.swift
//  Ricipidian
//
//  Created by Minh Tâm on 23/03/2021.
//

import ESTabBarController_swift
import UIKit

class MainTabBarController: ESTabBarController, UITabBarControllerDelegate {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        tabBar.barStyle = .black
    }
}
