//
//  AddMaterialTableViewCellViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 30/03/2021.
//

import Foundation

class AddMaterialTableViewCellViewModel: RowViewModel, CellDidSelect {
    var didSelectedItem: (() -> Void)?
}
