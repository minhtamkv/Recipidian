//
//  TotalTimeTableViewCell.swift
//  Ricipidian
//
//  Created by Minh Tâm on 09/05/2021.
//

import RxCocoa
import RxSwift
import UIKit

class TotalTimeTableViewCell: BaseTableViewCell {
    @IBOutlet var btTotalTime: UIButton!
    @IBOutlet var ivTotalTime: UIImageView!
    @IBOutlet var lbTotalTime: UILabel!
    var cellViewModel: TotalTimeTableViewCellViewModel!

    override func setupView(viewModel: RowViewModel) {
        cellViewModel = viewModel as? TotalTimeTableViewCellViewModel
        guard let cvm = cellViewModel else { return }
        if cvm.newRecipe.totalTime == nil {
            lbTotalTime.text = "Add time to cook"
        } else {
            let totalTime = cvm.newRecipe.totalTime
//            let formatter = DateFormatter()
//            formatter.dateFormat = "HH:mm"
//            let hour = formatter.string(from: totalTime)
            lbTotalTime.text = "\((totalTime ?? 0)/3600):\(((totalTime ?? 0) - Int((totalTime ?? 0)/3600)*3600)/60)"
        }
        btTotalTime.bindToWithTapAction(cvm.showTotalTime).disposed(by: disposeBag)
    }
}
