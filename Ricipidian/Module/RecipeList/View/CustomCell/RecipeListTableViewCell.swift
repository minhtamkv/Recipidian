//
//  RecipeListTableViewCell.swift
//  Ricipidian
//
//  Created by Minh Tâm on 24/03/2021.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

class RecipeListTableViewCell: BaseTableViewCell {
    var cellViewModel: RecipeListTableViewCellViewModel!

    override func setupView(viewModel: RowViewModel) {
        cellViewModel = viewModel as? RecipeListTableViewCellViewModel
        guard let cvm = cellViewModel else { return }
        contentView.backgroundColor = .clear
    }
}
