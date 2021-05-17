//
//  AddRecipeTableView.swift
//  Ricipidian
//
//  Created by Minh Tâm on 27/03/2021.
//

import Foundation
import UIKit

class AddRecipeTableView: TableViewCommon {
    override func registerCell() {
        registerTableViewCell(cellListName: [AddRecipe1TableViewCell.identifier, TotalTimeTableViewCell.identifier])
    }

    override func cellIdentifier(for viewModel: RowViewModel) -> String {
        switch viewModel {
        case is AddRecipe1TableViewCellViewModel:
            return AddRecipe1TableViewCell.identifier
        default:
            return TotalTimeTableViewCell.identifier
        }
    }

    override func setupTableView() {
        super.setupTableView()
        backgroundColor = UIColor(hexString: "292929")
    }

    override func heightHeaderSection() -> CGFloat {
        return 0
    }
}
