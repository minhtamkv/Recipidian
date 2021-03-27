//
//  AddRecipeTableView.swift
//  Ricipidian
//
//  Created by Minh Tâm on 27/03/2021.
//

import Foundation
import UIKit

class AddRecipeTableView: TableViewCommon {
    override func setupTableView() {
        super.setupTableView()
        configSelectionStyle(selectionStyle: .none, separatorStyle: .singleLine)
    }

    override func registerCell() {
        registerTableViewCell(cellListName: [AddRecipe1TableViewCell.identifier])
    }

    override func cellIdentifier(for viewModel: RowViewModel) -> String {
        return AddRecipe1TableViewCell.identifier
    }

    override func heightHeaderSection() -> CGFloat {
        return 0
    }
}
