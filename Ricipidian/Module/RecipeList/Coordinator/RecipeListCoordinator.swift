//
//  RecipeListCoordinator.swift
//  Ricipidian
//
//  Created by Minh Tâm on 23/03/2021.
//

import Foundation
import RxSwift
import UIKit

protocol IRecipeListCoordinator: Coordinator {
}

class RecipeListCoordinator: BaseCoordinator, IRecipeListCoordinator {
    override func start() {
        let vc = RecipeListViewController()
        navigation.pushViewController(vc)
    }
}

extension RecipeListCoordinator {
}
