//
//  AddRecipeViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 27/03/2021.
//

import RealmSwift
import RxCocoa

class AddRecipeViewModel: BaseCollectionVM, AddRecipeViewModelProtocol {
    var reloadTableView: PublishRelay<Void>
    var newRecipe: Recipe?
    var dismissAction: PublishRelay<Void>
    var nextAction: PublishRelay<Void>
    var showTotalTime: PublishRelay<Void>
    private let coordinator: AddRecipeCoordinatorProtocol

    init(coordinator: AddRecipeCoordinatorProtocol) {
        reloadTableView = PublishRelay<Void>()
        dismissAction = PublishRelay<Void>()
        nextAction = PublishRelay<Void>()
        showTotalTime = PublishRelay<Void>()
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

        dismissAction.subscribeShort { [weak self] _ in
            self?.coordinator.dismissAction()
        }.disposed(by: disposeBag)

        nextAction.subscribeShort { [weak self] _ in
            if !(self?.validate() ?? false) {
                return
            }
            
            self?.coordinator.nextAction()
        }.disposed(by: disposeBag)
    }

    func initData() {
        resetData()
        let row1 = AddRecipe1TableViewCellViewModel(newRecipe: newRecipe ?? Recipe())
        addRow(rowViewModel: row1)
        
        let row2 = TotalTimeTableViewCellViewModel(newRecipe: newRecipe ?? Recipe())
        row2.showTotalTime.subscribeShort { [weak self] _ in
            self?.showTotalTime.accept(())
            self?.reloadTableView.accept(())
        }.disposed(by: disposeBag)
        addRow(rowViewModel: row2)
        updateView()
    }
    
    func validate() -> Bool {
        if newRecipe?.name.trim() == "" {
            showMessageValidate.accept("You have to type your recipe name")
            return false
        }
        
        return true
    }
}
