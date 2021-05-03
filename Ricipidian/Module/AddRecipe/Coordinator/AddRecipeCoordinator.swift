//
//  AddRecipeCoordinator.swift
//  Ricipidian
//
//  Created by Minh Tâm on 27/03/2021.
//

import Foundation
import RxSwift
import UIKit

class AddRecipeCoordinator: BaseCoordinator, AddRecipeCoordinatorProtocol {
    var newRecipe: Recipe?
    var nav: UINavigationController?
    
    override func start() {
        let viewController = AddRecipeViewController()
        newRecipe = Recipe()
        let viewModel: AddRecipeViewModelProtocol = AddRecipeViewModel(coordinator: self)
        viewController.viewModel = viewModel
        viewModel.newRecipe = newRecipe
        nav = UINavigationController(rootViewController: viewController)
        nav?.modalPresentationStyle = .fullScreen
        nav?.setNavigationBarHidden(true, animated: true)
        navigation.present(nav ?? UINavigationController(), animated: true)
//        navigation.pushViewController(viewController)
    }
}

extension AddRecipeCoordinator {
    func dismissAction() {
        navigation.dismiss(animated: true)
    }
    
    func nextAction() {
        let coordinator = AddMaterialCoordinator(nav ?? UINavigationController())
        coordinator.newRecipe = newRecipe
        coordinate(to: coordinator)
    }
}
