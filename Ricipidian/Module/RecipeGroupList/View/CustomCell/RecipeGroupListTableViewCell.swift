//
//  RecipeGroupListTableViewCell.swift
//  Ricipidian
//
//  Created by Minh Tâm on 27/03/2021.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

class RecipeGroupListTableViewCell: BaseTableViewCell {
    var cellViewModel: RecipeGroupListTableViewCellViewModel!

    override func setupView(viewModel: RowViewModel) {
        cellViewModel = viewModel as? RecipeGroupListTableViewCellViewModel
        guard let cvm = cellViewModel else { return }
    }
}
