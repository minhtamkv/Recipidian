//
//  AddRecipe3TableViewCellViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 30/03/2021.
//

import Foundation

class AddRecipe3TableViewCellViewModel: RowViewModel {
    let stepTableViewViewModel: StepTableViewViewModel
    
    init() {
        stepTableViewViewModel = StepTableViewViewModel()
    }
}
