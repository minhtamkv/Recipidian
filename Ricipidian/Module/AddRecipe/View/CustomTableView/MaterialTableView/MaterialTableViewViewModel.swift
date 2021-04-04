//
//  MaterialTableViewViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 30/03/2021.
//

import Foundation
import RxCocoa
import RxSwift

class MaterialTableViewViewModel: BaseCollectionVM {
    var addRowWhenClickAdd = PublishRelay<Void>()
    
    func initData() {
        resetData()
        let row1 = MaterialTableViewCellViewModel()
        addRowWithSection(section: 0, rowViewModel: row1, headerTitle: "Material")
        let row = AddMaterialTableViewCellViewModel()
        row.didSelectedItem = { [weak self] in
            let newRow = MaterialTableViewCellViewModel()
            self?.addRow(rowViewModel: newRow)
            self?.addRowWhenClickAdd.accept(())
        }
        addRowWithSection(section: 0, rowViewModel: row)

        updateView()
    }
}
