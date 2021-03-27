//
//  AddRecipeViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 27/03/2021.
//

import RxCocoa
import RxSwift

class AddRecipeViewModel: BaseCollectionVM, AddRecipeViewModelProtocol {
    private let coordinator: AddRecipeCoordinatorProtocol

    init(coordinator: AddRecipeCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init()
    }

    override func makeSubcriptions() {
        viewDidLoad.subscribeShort { [weak self] _ in
            self?.initData()
        }.disposed(by: disposeBag)
    }

    func initData() {
        resetData()
        let row = AddRecipe1TableViewCellViewModel()
        addRow(rowViewModel: row)
        updateView()
    }
}
