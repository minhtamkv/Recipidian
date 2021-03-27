//
//  RecipeListViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 25/03/2021.
//

import RxCocoa
import RxSwift

class RecipeListViewModelViewModel: BaseCollectionVM, RecipeListViewModelProtocol {
    var showAddRecipe: PublishRelay<Void>
    private let coordinator: RecipeListCoordinatorProtocol

    init(coordinator: RecipeListCoordinatorProtocol) {
        self.coordinator = coordinator
        showAddRecipe = PublishRelay<Void>()
        super.init()
    }

    override func makeSubcriptions() {
        viewDidLoad.subscribeShort { [weak self] _ in
            self?.initData()
        }.disposed(by: disposeBag)

        showAddRecipe.subscribeShort { [weak self] _ in
            self?.coordinator.showAddRecipe()
        }.disposed(by: disposeBag)
    }

    func initData() {
        resetData()
        let row = RecipeListTableViewCellViewModel()
        addRow(rowViewModel: row)
        let row2 = RecipeListTableViewCellViewModel()
        addRow(rowViewModel: row2)
        updateView()
    }
}
