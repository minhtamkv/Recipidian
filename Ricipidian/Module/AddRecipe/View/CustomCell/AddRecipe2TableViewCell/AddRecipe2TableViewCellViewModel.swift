//
//  AddRecipe2TableViewCellViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 30/03/2021.
//

import Foundation
import RxCocoa

class AddRecipe2TableViewCellViewModel: RowViewModel {
    let materialTableViewViewModel: MaterialTableViewViewModel
    let reloadTableView: PublishRelay<Void>
    var recipe: Recipe
    
    init(recipe: Recipe) {
        materialTableViewViewModel = MaterialTableViewViewModel()
        reloadTableView = PublishRelay<Void>()
        self.recipe = recipe
    }
}
