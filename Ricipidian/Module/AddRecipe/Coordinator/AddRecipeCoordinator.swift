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
    override func start() {
        let viewController = AddRecipeViewController()
        let viewModel: AddRecipeViewModelProtocol = AddRecipeViewModel(coordinator: self)
        navigation.title = "Add Recipe"
        viewController.viewModel = viewModel
        let navigationController = UINavigationController(rootViewController: viewController)
        navigation.present(navigationController, animated: true)
    }
}

extension RecipeListCoordinator {
}
