//
//  AddRecipe2TableViewCellViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 30/03/2021.
//

import Foundation

class AddRecipe2TableViewCellViewModel: RowViewModel {
    let materialTableViewViewModel: MaterialTableViewViewModel
    
    init() {
        materialTableViewViewModel = MaterialTableViewViewModel()
    }
}
