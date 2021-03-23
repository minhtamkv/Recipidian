//
//  RecipeListViewController.swift
//  Ricipidian
//
//  Created by Minh Tâm on 23/03/2021.
//

import RxSwift
import UIKit

class RecipeListViewTableView: TableViewCommon {
    override func setupTableView() {
        super.setupTableView()
    }

    override func heightHeaderSection() -> CGFloat {
        return 0
    }
}

class RecipeListViewController: BaseTableViewController {
    override func viewDidLoad() {
        tableView.setClassOwnerNew(classNew: RecipeListViewTableView.self)
        super.viewDidLoad()
    }

    override func setupView() {
        navigationItem.title = "Ngày tiêm"
        tableView.selectionStyle = .none
        tableView.separatorStyle = .singleLine
        tabBarItem.title = "Quay lại"
        view.backgroundColor = UIColor(white: 245.0 / 255.0, alpha: 1.0)
    }
}
