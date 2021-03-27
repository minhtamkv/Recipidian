//
//  RecipeListCoordinator.swift
//  Ricipidian
//
//  Created by Minh Tâm on 23/03/2021.
//

import Foundation
import RxSwift
import UIKit

class RecipeListCoordinator: BaseCoordinator, RecipeListCoordinatorProtocol {
    override func start() {
        let vc = RecipeListViewController()
        let viewModel: RecipeListViewModelProtocol = RecipeListViewModelViewModel(coordinator: self)
        navigation.isNavigationBarHidden = true
        vc.viewModel = viewModel
        navigation.pushViewController(vc)
    }
}

extension RecipeListCoordinator {
    func showAddRecipe() {
        let coordinator = AddRecipeCoordinator(navigation)
        coordinate(to: coordinator)
    }
}
