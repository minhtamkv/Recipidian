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
    @IBOutlet var btDismiss: UIButton!
    @IBOutlet var tableView: AddRecipeTableView!
    @IBOutlet weak var btNext: UIButton!
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
        viewModel.reloadTableView.subscribeShort { [weak self] _ in
            self?.tableView.reloadData()
        }.disposed(by: disposeBag)
    }
    
    override func bindViews() {
        super.bindViews()
        btDismiss.bindToWithTapAction(viewModel.dismissAction).disposed(by: disposeBag)
        btNext.bindToWithTapAction(viewModel.nextAction).disposed(by: disposeBag)
    }
}
