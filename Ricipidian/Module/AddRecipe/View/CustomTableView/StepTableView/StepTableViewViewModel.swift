//
//  StepTableViewViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 30/03/2021.
//

import Foundation

class StepTableViewViewModel: BaseCollectionVM {
    func initData() {
        resetData()
        let row1 = StepTableViewCellViewModel()
        addRowWithSection(section: 0, rowViewModel: row1, headerTitle: "Steps")
        let row = AddStepTableViewCellViewModel()
        addRowWithSection(section: 0, rowViewModel: row)
        updateView()
    }
}
