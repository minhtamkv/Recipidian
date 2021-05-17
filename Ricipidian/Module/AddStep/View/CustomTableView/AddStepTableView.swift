//
//  AddStepTableView.swift
//  Ricipidian
//
//  Created by Minh Tâm on 04/05/2021.
//

import Foundation
import UIKit

class AddStepTableView: TableViewCommon {
    override func registerCell() {
        registerTableViewCell(cellListName: [AddStepTableViewCell.identifier, AddStepButtonTableViewCell.identifier])
    }

    override func cellIdentifier(for viewModel: RowViewModel) -> String {
        switch viewModel {
        case is AddStepTableViewCellViewModel:
            return AddStepTableViewCell.identifier
        default:
            return AddStepButtonTableViewCell.identifier
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
