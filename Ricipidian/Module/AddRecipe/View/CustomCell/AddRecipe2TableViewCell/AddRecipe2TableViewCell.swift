//
//  AddRecipe2TableViewCell.swift
//  Ricipidian
//
//  Created by Minh Tâm on 29/03/2021.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

class AddRecipe2TableViewCell: BaseTableViewCell {
    @IBOutlet weak var materialLabel: UILabel!
    @IBOutlet var materialTableView: MaterialTableView!
    var cellViewModel: AddRecipe2TableViewCellViewModel!

    override func setupView(viewModel: RowViewModel) {
        cellViewModel = viewModel as? AddRecipe2TableViewCellViewModel
        guard let cvm = cellViewModel else { return }
        materialTableView.setViewModel(viewModel: cvm.materialTableViewViewModel)
        cvm.materialTableViewViewModel.initData()
        backgroundColor = .gray
    }

    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        contentView.frame = bounds
        contentView.layoutIfNeeded()
        var size = CGSize(width: materialTableView.frame.width, height: materialTableView.contentSize.height + materialLabel.height + 500)
        size.height = materialTableView.contentSize.height
        return size
    }
}
