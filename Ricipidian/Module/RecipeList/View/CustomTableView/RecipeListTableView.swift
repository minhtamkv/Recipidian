//
//  RecipeListTableView.swift
//  Ricipidian
//
//  Created by Minh Tâm on 25/03/2021.
//

import Foundation
import UIKit

class RecipeListTableView: TableViewCommon {
    override func setupTableView() {
        super.setupTableView()
        configSelectionStyle(selectionStyle: .none, separatorStyle: .none)
        backgroundColor = UIColor(hexString: "292929")
    }

    override func registerCell() {
        registerTableViewCell(cellListName: [RecipeListTableViewCell.identifier])
    }

    override func cellIdentifier(for viewModel: RowViewModel) -> String {
        return RecipeListTableViewCell.identifier
    }

    override func heightHeaderSection() -> CGFloat {
        return 0
    }
}
