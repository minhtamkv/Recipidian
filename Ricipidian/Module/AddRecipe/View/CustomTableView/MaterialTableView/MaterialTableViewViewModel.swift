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

    func initData(recipe: Recipe) {
        resetData()
        for (index, _) in recipe.material.enumerated() {
            let row1 = MaterialTableViewCellViewModel(index: index, recipe: recipe)
            addRowWithSection(section: 0, rowViewModel: row1, headerTitle: "Material")
        }
        let row = AddMaterialTableViewCellViewModel()
        row.didSelectedItem = { [weak self] in
            recipe.material.append("")
            self?.addRowWhenClickAdd.accept(())
        }
        addRowWithSection(section: 0, rowViewModel: row, headerTitle: "Material")

        updateView()
    }
}
