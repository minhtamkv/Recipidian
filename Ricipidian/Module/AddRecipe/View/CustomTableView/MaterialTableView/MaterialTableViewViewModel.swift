//
//  MaterialTableViewViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 30/03/2021.
//

import Foundation

class MaterialTableViewViewModel: BaseCollectionVM {
    func initData() {
        resetData()
        let row1 = MaterialTableViewCellViewModel()
        addRow(rowViewModel: row1)

        let row = AddMaterialTableViewCellViewModel()
        addRow(rowViewModel: row)

        updateView()
    }
}
