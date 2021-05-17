//
//  AddStepCoordinator.swift
//  Ricipidian
//
//  Created by Minh Tâm on 04/05/2021.
//

import Foundation
import RxSwift
import UIKit

class AddStepCoordinator: BaseCoordinator, AddStepCoordinatorProtocol {
    var newRecipe: Recipe?
    
    override func start() {
        let viewController = AddStepViewController()
        let viewModel: AddStepViewModelProtocol = AddStepViewModel(coordinator: self)
        viewController.viewModel = viewModel
        viewModel.newRecipe = newRecipe
        navigation.pushViewController(viewController)
        
    }
}

extension AddStepCoordinator {
    func dismissAction() {
        navigation.popViewController()
    }
    
    func nextAction() {
        navigation.dismiss(animated: true)
    }
}
