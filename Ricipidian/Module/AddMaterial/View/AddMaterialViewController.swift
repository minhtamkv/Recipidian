//
//  AddMaterialViewController.swift
//  Ricipidian
//
//  Created by Minh Tâm on 03/05/2021.
//

import RxCocoa
import RxSwift
import UIKit

class AddMaterialViewController: BaseViewController {
    @IBOutlet var btDismiss: UIButton!
    @IBOutlet weak var btNext: UIButton!
    @IBOutlet weak var tableView: AddMaterialTableView!
    var viewModel: AddMaterialViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad.accept(())
    }

    override func setupView() {
        tableView.setViewModel(viewModel: viewModel)
    }

    override func bindViewModel() {
        subscribeCommon(viewModel: viewModel)
    }
    
    override func bindViews() {
        super.bindViews()
        btDismiss.bindToWithTapAction(viewModel.dismissAction).disposed(by: disposeBag)
        btNext.bindToWithTapAction(viewModel.nextAction).disposed(by: disposeBag)
    }
}
