//
//  CustomTableView.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import RxCocoa
import RxSwift
import UIKit

class CustomTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    var baseViewModel: IBaseCollectionVM!
    let disposeBag = DisposeBag()
    var selectionStyle: UITableViewCell.SelectionStyle = .default
    let didScrollToBottom = PublishRelay<Void>()
    private var countConfigView = 1

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setupView() {
    }

    func countConfigViewMax() -> Int {
        return 1
    }

    func setViewModel(viewModel: IBaseCollectionVM) {
        baseViewModel = viewModel
        if countConfigView <= countConfigViewMax() {
            setupTableView()
            registerCell()
            bindViewModel()
            countConfigView += 1
        }
    }

    func setViewModel(viewModel: BaseCollectionVM) {
        setViewModel(viewModel: viewModel as IBaseCollectionVM)
    }

    func configSelectionStyle(selectionStyle: UITableViewCell.SelectionStyle = .default, separatorStyle: UITableViewCell.SeparatorStyle = .singleLine) {
        self.separatorStyle = separatorStyle
        self.selectionStyle = selectionStyle
    }

    func setupTableView() {
        delegate = self
        dataSource = self
        tableFooterView = UIView()
        tableFooterView?.backgroundColor = .clear
        tableHeaderView = UIView()
        tableHeaderView?.backgroundColor = .clear
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 44.0
        // self.sectionFooterHeight = 0.0
        sectionHeaderHeight = 0.0

        // self.sectionHeaderHeight = UITableView.automaticDimension
        //  self.sectionFooterHeight = UITableView.automaticDimension
        backgroundColor = .white
    }

    func registerCell() {
    }

    func bindViewModel() {
        baseViewModel.sectionViewModels.asDriver()
            .skip(1)
            .drive(onNext: { _ in
                self.reloadData()
            }).disposed(by: disposeBag)

        detectScrollToBottom()
    }

    func detectScrollToBottom() {
        rx.willDisplayCell
            .flatMap { (_, indexPath) -> Observable<(section: Int, row: Int)> in
                Observable.of((indexPath.section, indexPath.row))
            }.filter { (section, row) -> Bool in
                let numberOfSections = self.numberOfSections
                let numberOfItems = self.numberOfRows(inSection: section)
                return section == numberOfSections - 1 && row == numberOfItems - 1
            }.map { _ in () }
            .bind(to: didScrollToBottom)
            .disposed(by: disposeBag)
    }

    func cellIdentifier(for viewModel: RowViewModel) -> String {
        fatalError("Must Override method cellIdentifier")
    }
}

extension CustomTableView {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionViewModel = baseViewModel.sectionViewModels.value[section]
        return sectionViewModel.rows.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return baseViewModel.sectionViewModels.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionViewModel = baseViewModel.sectionViewModels.value[indexPath.section]
        let rowViewModel = sectionViewModel.rows[indexPath.row]

        let identifier = cellIdentifier(for: rowViewModel)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) else { return UITableViewCell() }

        if let cell = cell as? CellConfigurable {
            cell.setupView(viewModel: rowViewModel)
        }
        cell.selectionStyle = selectionStyle
        // cell.layoutIfNeeded()
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionViewModel = baseViewModel.sectionViewModels.value[indexPath.section]
        let rowViewModel = sectionViewModel.rows[indexPath.row]
        if let rowViewModel = rowViewModel as? CellDidSelect {
            rowViewModel.didSelectedItem?()
        }
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let sectionViewModel = baseViewModel.sectionViewModels.value[indexPath.section]
        let rowViewModel = sectionViewModel.rows[indexPath.row]
        if let rowViewModel = rowViewModel as? CellDidDeselect {
            rowViewModel.didDeselectedItem?()
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionViewModel = baseViewModel.sectionViewModels.value[section]
        return sectionViewModel.headerTitle ?? nil
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if style == .plain {
            return sectionFooterHeight
        }
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if style == .plain {
            return sectionHeaderHeight
        }
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
}
