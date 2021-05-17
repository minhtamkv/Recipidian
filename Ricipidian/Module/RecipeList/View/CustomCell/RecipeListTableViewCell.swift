//
//  RecipeListTableViewCell.swift
//  Ricipidian
//
//  Created by Minh Tâm on 24/03/2021.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

class RecipeListTableViewCell: BaseTableViewCell {
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var numberOfStepLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    
    
    var cellViewModel: RecipeListTableViewCellViewModel!

    override func setupView(viewModel: RowViewModel) {
        cellViewModel = viewModel as? RecipeListTableViewCellViewModel
        guard let cvm = cellViewModel else { return }
        
        recipeNameLabel.text = cvm.recipe.name
        numberOfStepLabel.text = "\(cvm.recipe.step.count) step"
        if let date = cvm.recipe.totalTime?.miniSecondstoDateFull {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            totalTimeLabel.isHidden = true
            let hour = formatter.string(from: date)

            totalTimeLabel.text = "\(hour)"
        } else {
            totalTimeLabel.isHidden = true
        }
    }
}
