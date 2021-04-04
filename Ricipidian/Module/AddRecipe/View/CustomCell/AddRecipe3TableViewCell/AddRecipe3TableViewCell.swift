//
//  AddRecipe3TableViewCell.swift
//  Ricipidian
//
//  Created by Minh Tâm on 30/03/2021.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

class AddRecipe3TableViewCell: BaseTableViewCell {
    @IBOutlet var stepTableView: StepTableView!
    var cellViewModel: AddRecipe3TableViewCellViewModel!

    override func setupView(viewModel: RowViewModel) {
        cellViewModel = viewModel as? AddRecipe3TableViewCellViewModel
        guard let cvm = cellViewModel else { return }
        stepTableView.setViewModel(viewModel: cvm.stepTableViewViewModel)
        cvm.stepTableViewViewModel.initData()
    }

    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        contentView.frame = bounds
        contentView.layoutIfNeeded()
        var size = CGSize(width: stepTableView.frame.width, height: stepTableView.contentSize.height)
        size.height = stepTableView.contentSize.height
        return size
    }
}
