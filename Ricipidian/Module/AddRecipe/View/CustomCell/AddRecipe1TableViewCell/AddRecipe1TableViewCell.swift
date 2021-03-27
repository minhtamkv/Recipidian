//
//  AddRecipe1TableViewCell.swift
//  Ricipidian
//
//  Created by Minh Tâm on 27/03/2021.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

class AddRecipe1TableViewCell: BaseTableViewCell {
    var cellViewModel: AddRecipe1TableViewCellViewModel!

    override func setupView(viewModel: RowViewModel) {
        cellViewModel = viewModel as? AddRecipe1TableViewCellViewModel
        guard let cvm = cellViewModel else { return }
    }
}
