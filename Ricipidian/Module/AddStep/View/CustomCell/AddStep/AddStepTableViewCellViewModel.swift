//
//  AddStepTableViewCellViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 04/05/2021.
//

import Foundation
import RxCocoa

class AddStepTableViewCellViewModel: RowViewModel {
    var index: Int
    var newRecipe: Recipe
    var deleteSteplAction: PublishRelay<Void>
    
    init(index: Int, newRecipe: Recipe) {
        self.index = index
        self.newRecipe = newRecipe
        deleteSteplAction = PublishRelay<Void>()
    }
}
