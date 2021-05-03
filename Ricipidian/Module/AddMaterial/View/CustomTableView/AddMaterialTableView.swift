//
//  AddMaterialTableView.swift
//  Ricipidian
//
//  Created by Minh Tâm on 03/05/2021.
//

import Foundation
import UIKit

class AddMaterialTableView: TableViewCommon {
    override func registerCell() {
        registerTableViewCell(cellListName: [AddMaterialTableViewCell.identifier, AddMaterialButtonTableViewCell.identifier])
    }

    override func cellIdentifier(for viewModel: RowViewModel) -> String {
        switch viewModel {
        case is AddMaterialTableViewCellViewModel:
            return AddMaterialTableViewCell.identifier
        default:
            return AddMaterialButtonTableViewCell.identifier
        }
    }
    
    override func setupView() {
        super.setupView()
        backgroundColor = UIColor(hexString: "292929")
    }
    
    override func setupTableView() {
        super.setupTableView()
        backgroundColor = UIColor(hexString: "292929")
    }

    override func heightHeaderSection() -> CGFloat {
        return 0
    }
}
