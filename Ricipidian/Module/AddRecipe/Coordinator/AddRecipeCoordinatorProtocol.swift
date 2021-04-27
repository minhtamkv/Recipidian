//
//  AddRecipeCoordinatorProtocol.swift
//  Ricipidian
//
//  Created by Minh Tâm on 27/03/2021.
//

import Foundation

protocol AddRecipeCoordinatorProtocol: Coordinator {
    var newRecipe: Recipe? { get set }
}
