//
//  AddStepCoordinatorProtocol.swift
//  Ricipidian
//
//  Created by Minh Tâm on 04/05/2021.
//

import Foundation
import RxCocoa

protocol AddStepCoordinatorProtocol: Coordinator {
    var newRecipe: Recipe? { get set }
    func dismissAction()
    func nextAction()
}
