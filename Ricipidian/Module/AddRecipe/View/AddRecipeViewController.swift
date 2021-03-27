//
//  AddRecipeViewController.swift
//  Ricipidian
//
//  Created by Minh Tâm on 27/03/2021.
//

import RxCocoa
import RxSwift
import UIKit

class AddRecipeViewController: BaseTableViewController {
    var viewModel: AddRecipeViewModelProtocol!

    override func viewDidLoad() {
        tableView.setClassOwnerNew(classNew: AddRecipeTableView.self)
        super.viewDidLoad()
        viewModel.viewDidLoad.accept(())
    }

    override func setupView() {
        tableView.setViewModel(viewModel: viewModel)
        title = "Add Recipe"
    }

    override func bindViewModel() {
        subscribeCommon(viewModel: viewModel)
    }
}
