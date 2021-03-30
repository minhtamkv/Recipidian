//
//  MaterialTableViewCell.swift
//  Ricipidian
//
//  Created by Minh Tâm on 29/03/2021.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

class MaterialTableViewCell: BaseTableViewCell {
    var cellViewModel: MaterialTableViewCellViewModel!

    override func setupView(viewModel: RowViewModel) {
        cellViewModel = viewModel as? MaterialTableViewCellViewModel
        guard let cvm = cellViewModel else { return }
    }
}
