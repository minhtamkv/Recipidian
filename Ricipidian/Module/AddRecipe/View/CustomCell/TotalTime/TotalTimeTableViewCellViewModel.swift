//
//  TotalTimeTableViewCellViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 09/05/2021.
//

import RxCocoa

class TotalTimeTableViewCellViewModel: RowViewModel {
    var newRecipe: Recipe
    var showTotalTime: PublishRelay<Void>
    
    init(newRecipe: Recipe) {
        self.newRecipe = newRecipe
        showTotalTime = PublishRelay<Void>()
    }
}
