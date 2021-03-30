//
//  AddMaterialTableViewCell.swift
//  Ricipidian
//
//  Created by Minh Tâm on 30/03/2021.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

class AddMaterialTableViewCell: BaseTableViewCell {
    var cellViewModel: AddMaterialTableViewCellViewModel!

    override func setupView(viewModel: RowViewModel) {
        cellViewModel = viewModel as? AddMaterialTableViewCellViewModel
        guard let cvm = cellViewModel else { return }
    }
}
