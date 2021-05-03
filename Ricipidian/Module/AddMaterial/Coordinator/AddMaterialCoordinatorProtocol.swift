//
//  AddMaterialCoordinatorProtocol.swift
//  Ricipidian
//
//  Created by Minh Tâm on 03/05/2021.
//

import Foundation
import RxCocoa

protocol AddMaterialCoordinatorProtocol: Coordinator {
    var newRecipe: Recipe? { get set }
    func dismissAction()
    func nextAction()
}
