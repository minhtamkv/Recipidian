//
//  RecipeListViewController.swift
//  Ricipidian
//
//  Created by Minh Tâm on 23/03/2021.
//

import RxCocoa
import RxSwift
import UIKit

class RecipeListViewController: BaseViewController {
    @IBOutlet var tableView: RecipeListTableView!
    @IBOutlet var addRecipeButton: UIButton!
    var viewModel: RecipeListViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad.accept(())
    }

    override func setupView() {
        super.setupView()
        tableView.setViewModel(viewModel: viewModel)
    }

    override func bindViewModel() {
        super.bindViewModel()
        subscribeCommon(viewModel: viewModel)
    }

    override func bindViews() {
        super.bindViews()
        addRecipeButton.bindToWithTapAction(viewModel.showAddRecipe).disposed(by: disposeBag)
    }
}
