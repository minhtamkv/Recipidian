//
//  AddMaterialTableViewCell.swift
//  Ricipidian
//
//  Created by Minh Tâm on 03/05/2021.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

class AddMaterialTableViewCell: BaseTableViewCell {
    @IBOutlet weak var ctfvMaterial: CustomTextFieldView!
    @IBOutlet weak var btDeleteMaterial: UIButton!
    var cellViewModel: AddMaterialTableViewCellViewModel!

    override func setupView(viewModel: RowViewModel) {
        cellViewModel = viewModel as? AddMaterialTableViewCellViewModel
        guard let cvm = cellViewModel else { return }
        ctfvMaterial.textValue = cvm.newRecipe.material[cvm.index]
        ctfvMaterial.placeholder = "Material \(cvm.index + 1)"
        
        ctfvMaterial.subscribeText { text in
            cvm.newRecipe.material[cvm.index] = text
        }
        
        btDeleteMaterial.bindToWithTapAction(cvm.deleteMaterialAction).disposed(by: disposeBag)
    }
}
