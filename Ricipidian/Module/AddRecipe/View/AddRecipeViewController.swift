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
    @IBOutlet var btNext: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    var picker = UIDatePicker()
    var viewModel: AddRecipeViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad.accept(())
    }

    override func setupView() {
        tableView.setViewModel(viewModel: viewModel)
        title = "Add Recipe"
        datePicker.isHidden = true
        toolBar.isHidden = true
    }

    override func bindViewModel() {
        subscribeCommon(viewModel: viewModel)
        viewModel.reloadTableView.subscribeShort { [weak self] _ in
            self?.tableView.reloadData()
        }.disposed(by: disposeBag)

        viewModel.showTotalTime.subscribeShort { [weak self] _ in
            self?.initTotalTime()
        }.disposed(by: disposeBag)
    }

    func initTotalTime() {
        datePicker.backgroundColor = .white
        if let currentTotalTime = viewModel.newRecipe?.totalTime {
            datePicker.date.hour = Int(currentTotalTime/3600)
            datePicker.date.minute = Int((currentTotalTime - (currentTotalTime/3600))/60)
        } else {
            datePicker.date.hour = 0
            datePicker.date.minute = 0
        }
        datePicker.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        toolBar.tintColor = .blue
        cancelButton.addTargetForAction(self, action: #selector(cancelTapped))
        doneButton.addTargetForAction(self, action: #selector(doneTapped))
        toolBar.isHidden = false
        datePicker.isHidden = false
    }

    @objc func doneTapped() {
        print("Close date picker")
        viewModel.newRecipe?.totalTime = datePicker.date.hour * 3600 + datePicker.date.minute * 60
        datePicker.isHidden = true
        toolBar.isHidden = true
        tableView.reloadData()
    }
    
    @objc func valueChanged() {
        print("Close date picker")
        viewModel.newRecipe?.totalTime = datePicker.date.millisecond
    }

    @objc func cancelTapped(sender: UIBarButtonItem) {
        print("Close date picker")
        datePicker.isHidden = true
        toolBar.isHidden = true
    }

    override func bindViews() {
        super.bindViews()
        btDismiss.bindToWithTapAction(viewModel.dismissAction).disposed(by: disposeBag)
        btNext.bindToWithTapAction(viewModel.nextAction).disposed(by: disposeBag)
    }
}
