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
        let home2Navigation = initTabHome2()
        let home3Navigation = initTabHome3()
        let home4Navigation = initTabHome4()
        let home5Navigation = initTabHome5()

        tabBarController.viewControllers = [homeNavigation, home2Navigation, home3Navigation, home4Navigation, home5Navigation]

        tabBarController.modalPresentationStyle = .overFullScreen
    }

    private func initTabHome() -> BaseNavigationController {
        let navigation = BaseNavigationController()
        navigation.tabBarItem = ESTabBarItem(CustomTabbarItemView(), title: "Trang chủ", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"), tag: 0)

        let coordinator: IRecipeListCoordinator = RecipeListCoordinator(navigation)
        coordinate(to: coordinator)

        return navigation
    }

    private func initTabHome2() -> BaseNavigationController {
        let navigation = BaseNavigationController()
        navigation.tabBarItem = ESTabBarItem(CustomTabbarItemView(), title: "Trang chủ", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"), tag: 0)

        let coordinator: IRecipeListCoordinator = RecipeListCoordinator(navigation)
        coordinate(to: coordinator)

        return navigation
    }

    private func initTabHome3() -> BaseNavigationController {
        let navigation = BaseNavigationController()
        navigation.tabBarItem = ESTabBarItem(CustomTabbarItemView(), title: "Trang chủ", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"), tag: 0)

        let coordinator: IRecipeListCoordinator = RecipeListCoordinator(navigation)
        coordinate(to: coordinator)

        return navigation
    }

    private func initTabHome4() -> BaseNavigationController {
        let navigation = BaseNavigationController()
        navigation.tabBarItem = ESTabBarItem(CustomTabbarItemView(), title: "Trang chủ", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"), tag: 0)

        let coordinator: IRecipeListCoordinator = RecipeListCoordinator(navigation)
        coordinate(to: coordinator)

        return navigation
    }

    private func initTabHome5() -> BaseNavigationController {
        let navigation = BaseNavigationController()
        navigation.tabBarItem = ESTabBarItem(CustomTabbarItemView(), title: "Trang chủ", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"), tag: 0)

        let coordinator: IRecipeListCoordinator = RecipeListCoordinator(navigation)
        coordinate(to: coordinator)

        return navigation
    }
}

extension MainTabBarCoordinator: IMainTabBarCoordinator {
}
