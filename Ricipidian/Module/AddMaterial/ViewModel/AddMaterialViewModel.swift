//
//  AddMaterialViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 03/05/2021.
//

import RealmSwift
import RxCocoa

class AddMaterialViewModel: BaseCollectionVM, AddMaterialViewModelProtocol {
    var reloadTableView: PublishRelay<Void>
    var newRecipe: Recipe?
    var dismissAction: PublishRelay<Void>
    var nextAction: PublishRelay<Void>
    private let coordinator: AddMaterialCoordinatorProtocol

    init(coordinator: AddMaterialCoordinatorProtocol) {
        reloadTableView = PublishRelay<Void>()
        dismissAction = PublishRelay<Void>()
        nextAction = PublishRelay<Void>()
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

            let realm = try! Realm()

            try! realm.write {
                realm.add(self?.newRecipe ?? Recipe())
            }
            self?.coordinator.nextAction()
        }.disposed(by: disposeBag)
    }

    func initData() {
        resetData()
        guard let material = newRecipe?.material else {
            return
        }
        for (index, _) in material.enumerated() {
            let row = AddMaterialTableViewCellViewModel(index: index, newRecipe: newRecipe ?? Recipe())
            row.deleteMaterialAction.subscribeShort { [weak self] _ in
                self?.newRecipe?.material.remove(at: index)
                self?.reloadTableView.accept(())
            }.disposed(by: disposeBag)
            addRow(rowViewModel: row)
        }

        let row = AddMaterialButtonTableViewCellViewModel()
        row.addMaterialAction.subscribeShort { [weak self] _ in
            if !(self?.validate() ?? false) {
                return
            }
            self?.newRecipe?.material.append("")
            self?.reloadTableView.accept(())
        }.disposed(by: disposeBag)
        addRow(rowViewModel: row)
        updateView()
    }

    func validate() -> Bool {
        if newRecipe?.material.count != 0 && newRecipe?.material.last?.trimmed == "" {
            showMessageValidate.accept("You have to type your material")

            return false
        }
        return true
    }
}
