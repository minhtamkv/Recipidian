//
//  AddStepViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 04/05/2021.
//

import RealmSwift
import RxCocoa

class AddStepViewModel: BaseCollectionVM, AddStepViewModelProtocol {
    var reloadTableView: PublishRelay<Void>
    var newRecipe: Recipe?
    var dismissAction: PublishRelay<Void>
    var nextAction: PublishRelay<Void>
    private let coordinator: AddStepCoordinatorProtocol

    init(coordinator: AddStepCoordinatorProtocol) {
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
        guard let step = newRecipe?.step else {
            return
        }
        for (index, _) in step.enumerated() {
            let row = AddStepTableViewCellViewModel(index: index, newRecipe: newRecipe ?? Recipe())
            row.deleteSteplAction.subscribeShort { [weak self] _ in
                self?.newRecipe?.step.remove(at: index)
                self?.reloadTableView.accept(())
            }.disposed(by: disposeBag)
            addRow(rowViewModel: row)
        }

        let row = AddStepButtonTableViewCellViewModel()
        row.addStepAction.subscribeShort { [weak self] _ in
            if !(self?.validate() ?? false) {
                return
            }
            self?.newRecipe?.step.append("")
            self?.reloadTableView.accept(())
        }.disposed(by: disposeBag)
        addRow(rowViewModel: row)
        updateView()
    }

    func validate() -> Bool {
        if newRecipe?.material.count != 0 && newRecipe?.step.last?.trimmed == "" {
            showMessageValidate.accept("You have to type your step")

            return false
        }
        return true
    }
}
