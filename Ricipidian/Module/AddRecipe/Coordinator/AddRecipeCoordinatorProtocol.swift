//
//  AddRecipeCoordinatorProtocol.swift
//  Ricipidian
//
//  Created by Minh Tâm on 27/03/2021.
//

import Foundation
import RxCocoa

protocol AddRecipeCoordinatorProtocol: Coordinator {
    var newRecipe: Recipe? { get set }
    func dismissAction()
    func nextAction()
}
