//
//  StepTableView.swift
//  Ricipidian
//
//  Created by Minh Tâm on 30/03/2021.
//

import Foundation
import UIKit

class StepTableView: TableViewCommon {
    override func setupTableView() {
        super.setupTableView()
        isScrollEnabled = false
    }
    
    override func registerCell() {
        registerTableViewCell(cellListName: [StepTableViewCell.identifier, AddStepTableViewCell.identifier])
    }

    override func cellIdentifier(for viewModel: RowViewModel) -> String {
        switch viewModel {
        case is StepTableViewCellViewModel:
            return StepTableViewCell.identifier
        default:
            return AddStepTableViewCell.identifier
        }
    }
}
