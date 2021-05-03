//
//  AddMaterialButtonTableViewCellViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 03/05/2021.
//

import Foundation
import RxCocoa

class AddMaterialButtonTableViewCellViewModel: RowViewModel {
    var addMaterialAction: PublishRelay<Void>
    
    init() {
        addMaterialAction = PublishRelay<Void>()
    }
}
