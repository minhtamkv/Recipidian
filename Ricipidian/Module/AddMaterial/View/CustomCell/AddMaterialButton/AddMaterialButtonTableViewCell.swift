//
//  AddMaterialButtonTableViewCell.swift
//  Ricipidian
//
//  Created by Minh Tâm on 03/05/2021.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

class AddMaterialButtonTableViewCell: BaseTableViewCell {
    @IBOutlet weak var btAddMaterial: UIButton!
    var cellViewModel: AddMaterialButtonTableViewCellViewModel!

    override func setupView(viewModel: RowViewModel) {
        cellViewModel = viewModel as? AddMaterialButtonTableViewCellViewModel
        guard let cvm = cellViewModel else { return }
        btAddMaterial.bindToWithTapAction(cvm.addMaterialAction).disposed(by: disposeBag)
    }
}
