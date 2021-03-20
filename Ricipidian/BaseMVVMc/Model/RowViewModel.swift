//
//  RowViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import Foundation

protocol RowViewModel {
    // TO DO
}

protocol RowViewModelReloadData {
    func reloadData()
    func reloadDataViewPrevious()
}

protocol CellIdentifier {
    var cellIdentifier: String { get set }
}

protocol CellDidSelect {
    var didSelectedItem: (() -> Void)? { get set }
}

protocol CellDidDeselect {
    var didDeselectedItem: (() -> Void)? { get set }
}

protocol RowViewModelUpdateLanguage {
    func updateLanguage()
}
