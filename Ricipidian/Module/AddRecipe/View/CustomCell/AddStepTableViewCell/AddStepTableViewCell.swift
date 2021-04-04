//
//  AddStepTableViewCell.swift
//  Ricipidian
//
//  Created by Minh Tâm on 30/03/2021.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

class AddStepTableViewCell: BaseTableViewCell {
    var cellViewModel: AddStepTableViewCellViewModel!

    override func setupView(viewModel: RowViewModel) {
        cellViewModel = viewModel as? AddStepTableViewCellViewModel
        guard let cvm = cellViewModel else { return }
    }
}
