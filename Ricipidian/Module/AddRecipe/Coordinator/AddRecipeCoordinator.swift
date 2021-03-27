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
        navigation.isNavigationBarHidden = true
        viewController.viewModel = viewModel
        navigation.present(viewController, animated: true)
    }
}

extension RecipeListCoordinator {
}
