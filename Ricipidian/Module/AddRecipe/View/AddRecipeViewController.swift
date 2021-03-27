//
//  AddRecipeViewController.swift
//  Ricipidian
//
//  Created by Minh Tâm on 27/03/2021.
//

import RxCocoa
import RxSwift
import UIKit

class AddRecipeViewController: BaseViewController {
    @IBOutlet weak var tableView: AddRecipeTableView!
    var viewModel: AddRecipeViewModelProtocol!

    override func viewDidLoad() {
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
