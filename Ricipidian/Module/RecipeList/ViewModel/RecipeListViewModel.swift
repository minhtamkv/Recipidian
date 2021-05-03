//
//  RecipeListViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 25/03/2021.
//

import RealmSwift
import RxCocoa
import RxSwift

class RecipeListViewModelViewModel: BaseCollectionVM, RecipeListViewModelProtocol {
    var showAddRecipe: PublishRelay<Void>
    var listRecipe = [Recipe]()
    private let coordinator: RecipeListCoordinatorProtocol

    init(coordinator: RecipeListCoordinatorProtocol) {
        self.coordinator = coordinator
        showAddRecipe = PublishRelay<Void>()
        super.init()
    }

    override func makeSubcriptions() {
        viewDidLoad.subscribeShort { [weak self] _ in
            self?.fetchData()
        }.disposed(by: disposeBag)

        showAddRecipe.subscribeShort { [weak self] _ in
            self?.coordinator.showAddRecipe()
        }.disposed(by: disposeBag)
    }

    func initData(_ arr: [Recipe]) {
        resetData()
        for value in arr {
            let row = RecipeListTableViewCellViewModel()
            addRow(rowViewModel: row)
        }
        updateView()
    }
}

extension RecipeListViewModelViewModel {
    func fetchData() {
        let realm = try! Realm()
        // results
        let results = realm.objects(Recipe.self)

        // convert to array
        var arr = [Recipe]()
        arr = Array(results)
        initData(arr)
    }
}
