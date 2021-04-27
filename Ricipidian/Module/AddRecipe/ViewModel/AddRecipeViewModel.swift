//
//  AddRecipeViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 27/03/2021.
//

import RxCocoa

class AddRecipeViewModel: BaseCollectionVM, AddRecipeViewModelProtocol {
    var reloadTableView: PublishRelay<Void>
    var newRecipe: Recipe?
    private let coordinator: AddRecipeCoordinatorProtocol

    init(coordinator: AddRecipeCoordinatorProtocol) {
        reloadTableView = PublishRelay<Void>()
        self.coordinator = coordinator
        super.init()
    }

    override func makeSubcriptions() {
        viewDidLoad.subscribeShort { [weak self] _ in
            self?.initData()
        }.disposed(by: disposeBag)
        
        reloadTableView.subscribeShort { [weak self] _ in
            self?.initData()
        }.disposed(by: disposeBag)
    }

    func initData() {
        resetData()
        let row1 = AddRecipe1TableViewCellViewModel()
        addRow(rowViewModel: row1)
        
        let row2 = AddRecipe2TableViewCellViewModel(recipe: newRecipe ?? Recipe())
        addRow(rowViewModel: row2)
        row2.reloadTableView.subscribeShort { [weak self] _ in
            self?.reloadTableView.accept(())
        }.disposed(by: disposeBag)
        
        let row3 = AddRecipe3TableViewCellViewModel()
        addRow(rowViewModel: row3)
        updateView()
    }
}
