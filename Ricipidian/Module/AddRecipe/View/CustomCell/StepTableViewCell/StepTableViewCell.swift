//
//  StepTableViewCell.swift
//  Ricipidian
//
//  Created by Minh Tâm on 30/03/2021.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

class StepTableViewCell: BaseTableViewCell {
    var cellViewModel: StepTableViewCellViewModel!

    override func setupView(viewModel: RowViewModel) {
        cellViewModel = viewModel as? StepTableViewCellViewModel
        guard let cvm = cellViewModel else { return }
    }
}
