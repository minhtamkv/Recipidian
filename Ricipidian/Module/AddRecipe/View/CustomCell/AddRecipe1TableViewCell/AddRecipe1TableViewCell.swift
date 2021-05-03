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
    @IBOutlet weak var ctfvRecipeName: CustomTextFieldView!
    @IBOutlet weak var ctfvDesciption: CustomTextAreaView!
    var cellViewModel: AddRecipe1TableViewCellViewModel!

    override func setupView(viewModel: RowViewModel) {
        cellViewModel = viewModel as? AddRecipe1TableViewCellViewModel
        guard let cvm = cellViewModel else { return }
        
        ctfvRecipeName.subscribeText { text in
            cvm.newRecipe.name = text
        }
        
        ctfvDesciption.subscribeText { text in
            cvm.newRecipe.foodDescription = text
        }
    }
}
