//
//  AddMaterialCoordinator.swift
//  Ricipidian
//
//  Created by Minh Tâm on 03/05/2021.
//

import Foundation
import RxSwift
import UIKit

class AddMaterialCoordinator: BaseCoordinator, AddMaterialCoordinatorProtocol {
    var newRecipe: Recipe?

    override func start() {
        let viewController = AddMaterialViewController()
        let viewModel: AddMaterialViewModelProtocol = AddMaterialViewModel(coordinator: self)
        viewController.viewModel = viewModel
        viewModel.newRecipe = newRecipe
        navigation.pushViewController(viewController)
    }
}

extension AddMaterialCoordinator {
    func dismissAction() {
        navigation.popViewController()
    }

    func nextAction() {
        let coordinator = AddStepCoordinator(navigation)
        coordinator.newRecipe = newRecipe
        coordinate(to: coordinator)
    }
}
