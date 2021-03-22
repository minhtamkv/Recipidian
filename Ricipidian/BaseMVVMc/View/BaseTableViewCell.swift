//
//  BaseTableViewCell.swift
//  Ricipidian
//
//  Created by Minh Tâm on 22/03/2021.
//

import RxCocoa
import RxSwift
import UIKit

class BaseTableViewCell: UITableViewCell, CellConfigurable {
    var disposeBag = DisposeBag()

    func setupView(viewModel: RowViewModel) {
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
}
