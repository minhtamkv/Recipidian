//
//  MainTabbarCoordinator.swift
//  Ricipidian
//
//  Created by Minh Tâm on 23/03/2021.
//

import ESTabBarController_swift
import UIKit

protocol IMainTabBarCoordinator: Coordinator {
}

class MainTabBarCoordinator: BaseCoordinator {
    override func start() {
        let tabBarController = MainTabBarController()
        GlobalData.shared.mainTabbar = tabBarController
        navigation = BaseNavigationController(rootViewController: tabBarController)

        let homeNavigation = initTabHome()
        let hom2 = initTabHome2()

        tabBarController.viewControllers = [homeNavigation, hom2]

        tabBarController.modalPresentationStyle = .overFullScreen
    }

    private func initTabHome() -> BaseNavigationController {
        let navigation = BaseNavigationController()
        navigation.tabBarItem = ESTabBarItem(CustomTabbarItemView(), title: "Trang chủ", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"), tag: 0)

        let coordinator: RecipeListCoordinatorProtocol = RecipeListCoordinator(navigation)
        coordinate(to: coordinator)

        return navigation
    }

    private func initTabHome2() -> BaseNavigationController {
        let navigation = BaseNavigationController()
        navigation.tabBarItem = ESTabBarItem(CustomTabbarItemView(), title: "Trang chủ", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"), tag: 0)

        let coordinator: RecipeListCoordinatorProtocol = RecipeListCoordinator(navigation)
        coordinate(to: coordinator)

        return navigation
    }

}

extension MainTabBarCoordinator: IMainTabBarCoordinator {
}
