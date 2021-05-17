//
//  AddStepButtonTableViewCellViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 04/05/2021.
//

import Foundation
import RxCocoa

class AddStepButtonTableViewCellViewModel: RowViewModel {
    var addStepAction: PublishRelay<Void>
    
    init() {
        addStepAction = PublishRelay<Void>()
    }
}
