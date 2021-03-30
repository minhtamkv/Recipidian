//
//  MaterialTableView.swift
//  Ricipidian
//
//  Created by Minh Tâm on 30/03/2021.
//

import Foundation
import UIKit

class MaterialTableView: TableViewCommon {
    override func setupTableView() {
        super.setupTableView()
    }
    
    override func registerCell() {
        registerTableViewCell(cellListName: [MaterialTableViewCell.identifier, AddMaterialTableViewCell.identifier])
    }

    override func cellIdentifier(for viewModel: RowViewModel) -> String {
        switch viewModel {
        case is MaterialTableViewCellViewModel:
            return MaterialTableViewCell.identifier
        default:
            return AddMaterialTableViewCell.identifier
        }
    }

    override func heightHeaderSection() -> CGFloat {
        return 0
    }
}
