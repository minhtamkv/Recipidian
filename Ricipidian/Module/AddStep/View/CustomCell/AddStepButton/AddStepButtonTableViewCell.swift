//
//  AddStepButtonTableViewCell.swift
//  Ricipidian
//
//  Created by Minh Tâm on 04/05/2021.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

class AddStepButtonTableViewCell: BaseTableViewCell {
    @IBOutlet weak var btAddStep: UIButton!
    var cellViewModel: AddStepButtonTableViewCellViewModel!

    override func setupView(viewModel: RowViewModel) {
        cellViewModel = viewModel as? AddStepButtonTableViewCellViewModel
        guard let cvm = cellViewModel else { return }
        btAddStep.bindToWithTapAction(cvm.addStepAction).disposed(by: disposeBag)
    }
}
