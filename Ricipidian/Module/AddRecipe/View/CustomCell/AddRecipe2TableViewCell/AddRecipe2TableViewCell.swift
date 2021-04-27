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
    @IBOutlet var materialTableView: MaterialTableView!
    var cellViewModel: AddRecipe2TableViewCellViewModel!

    override func setupView(viewModel: RowViewModel) {
        cellViewModel = viewModel as? AddRecipe2TableViewCellViewModel
        guard let cvm = cellViewModel else { return }
        materialTableView.setViewModel(viewModel: cvm.materialTableViewViewModel)
        cvm.materialTableViewViewModel.initData(recipe: cvm.recipe)
        cvm.materialTableViewViewModel.addRowWhenClickAdd.subscribeShort { [weak self] _ in
            cvm.reloadTableView.accept(())
        }.disposed(by: disposeBag)
    }

    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        contentView.frame = bounds
        contentView.layoutIfNeeded()
        var size = CGSize(width: materialTableView.frame.width, height: materialTableView.contentSize.height)
        size.height = materialTableView.contentSize.height
        return size
    }
}
