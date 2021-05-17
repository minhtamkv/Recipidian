//
//  AddStepTableViewCell.swift
//  Ricipidian
//
//  Created by Minh Tâm on 04/05/2021.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

class AddStepTableViewCell: BaseTableViewCell {
    @IBOutlet weak var ctfvStep: CustomTextAreaView!
    @IBOutlet weak var btDeleteStep: UIButton!
    var cellViewModel: AddStepTableViewCellViewModel!

    override func setupView(viewModel: RowViewModel) {
        cellViewModel = viewModel as? AddStepTableViewCellViewModel
        guard let cvm = cellViewModel else { return }
        ctfvStep.textValue = cvm.newRecipe.step[cvm.index]
        ctfvStep.placeholder = "Step \(cvm.index + 1)"
        
        ctfvStep.subscribeText { text in
            cvm.newRecipe.step[cvm.index] = text
        }
        
        btDeleteStep.bindToWithTapAction(cvm.deleteSteplAction).disposed(by: disposeBag)
    }
}
