//
//  AddRecipe1TableViewCellViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 27/03/2021.
//

import Foundation

class AddRecipe1TableViewCellViewModel: RowViewModel {
    var newRecipe: Recipe
    
    init(newRecipe: Recipe) {
        self.newRecipe = newRecipe
    }
}

