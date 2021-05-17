//
//  RecipeListTableViewCellViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 25/03/2021.
//

import Foundation

class RecipeListTableViewCellViewModel: RowViewModel {
    var recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
}
