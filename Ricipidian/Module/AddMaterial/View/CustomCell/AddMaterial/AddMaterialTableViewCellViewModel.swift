//
//  AddMaterialTableViewCellViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 03/05/2021.
//

import Foundation
import RxCocoa

class AddMaterialTableViewCellViewModel: RowViewModel {
    var index: Int
    var newRecipe: Recipe
    var deleteMaterialAction: PublishRelay<Void>
    
    init(index: Int, newRecipe: Recipe) {
        self.index = index
        self.newRecipe = newRecipe
        deleteMaterialAction = PublishRelay<Void>()
    }
}
