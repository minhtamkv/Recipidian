//
//  BaseTableViewController.swift
//  Ricipidian
//
//  Created by Minh Tâm on 22/03/2021.
//

import UIKit

class BaseTableViewController: BaseViewController {
    weak var tableView: CustomTableView!
    var useLoadingDefault = false

    override func loadView() {
        super.loadView()
        let tableView = CustomTableView()
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.snp.makeConstraints { view in
            view.top.equalToSuperview().offset(0)
            view.bottom.equalToSuperview().offset(0)
            view.trailing.equalToSuperview().offset(0)
            view.leading.equalToSuperview().offset(0)
        }

        self.tableView = tableView
    }

    override func subscribeLoading(_ viewModel: IBaseViewModel) {
        if useLoadingDefault {
            super.subscribeLoading(viewModel)
            return
        }

        if let tableViewCommon = tableView as? TableViewCommon {
            viewModel.isLoading
                .subscribeShort { isLoading in
                    if isLoading {
                        tableViewCommon.startLoading()
                    } else {
                        tableViewCommon.stopLoading()
                    }
                }.disposed(by: disposeBag)
        } else {
            super.subscribeLoading(viewModel)
        }
    }
}
