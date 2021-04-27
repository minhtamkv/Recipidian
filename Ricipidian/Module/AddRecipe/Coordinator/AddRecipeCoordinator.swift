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
    
    override func start() {
        let viewController = AddRecipeViewController()
        newRecipe = Recipe()
        let viewModel: AddRecipeViewModelProtocol = AddRecipeViewModel(coordinator: self)
        viewController.viewModel = viewModel
        viewModel.newRecipe = newRecipe
        navigation.present(viewController, animated: true)
    }
}

extension RecipeListCoordinator {
}
