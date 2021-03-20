//
//  CustomCollectionView.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import RxCocoa
import RxSwift
import UIKit

protocol ICustomCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
}

class CustomCollectionView: UICollectionView, ICustomCollectionView {
    var baseViewModel: IBaseCollectionVM!
    let disposeBag = DisposeBag()
    private var indexPathDefault: IndexPath?
    private var isSelectElementFirst = false
    private var countConfigView = 1
    let didScrollToBottom = PublishRelay<Void>()

    func setupView() {
    }

    func countConfigViewMax() -> Int {
        return 1
    }

    func setViewModel(viewModel: IBaseCollectionVM, isSelectElementFirst: Bool = false) {
        self.isSelectElementFirst = isSelectElementFirst
        baseViewModel = viewModel
        if countConfigView <= countConfigViewMax() {
            setupView()
            setDelegate()
            registerCell()
            countConfigView += 1
        }
        bindViewModel()
    }

    func setViewModel(viewModel: BaseCollectionVM) {
        setViewModel(viewModel: viewModel as IBaseCollectionVM)
    }

    func setDelegate() {
        delegate = self
        dataSource = self
    }

    func registerCell() {
    }

    func reloadDataView() {
        reloadData()
    }

    func bindViewModel() {
        baseViewModel.sectionViewModels.asDriver().skip(1).drive(onNext: { [weak self] _ in
            self?.reloadData()
        }).disposed(by: disposeBag)

        detectScrollToBottom()
    }

    func cellIdentifier(for viewModel: RowViewModel) -> String {
        fatalError("Must Override method cellIdentifier")
    }

    func detectScrollToBottom() {
        rx.willDisplayCell.flatMap { (_, indexPath) -> Observable<(section: Int, row: Int)> in
            Observable.of((indexPath.section, indexPath.row))
        }.filter { (section, row) -> Bool in
            let numberOfSections = self.numberOfSections
            let numberOfItems = self.numberOfItems(inSection: section)
            return section == numberOfSections - 1 && row == numberOfItems - 1
        }.map { _ in () }.bind(to: didScrollToBottom).disposed(by: disposeBag)
    }
}

extension CustomCollectionView {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionViewModel = baseViewModel.sectionViewModels.value[section]
        return sectionViewModel.rows.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionViewModel = baseViewModel.sectionViewModels.value[indexPath.section]
        let rowViewModel = sectionViewModel.rows[indexPath.row]
        let identifier = cellIdentifier(for: rowViewModel)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        if let cell = cell as? CellConfigurable {
            cell.setupView(viewModel: rowViewModel)
        }

        if isSelectElementFirst && indexPath.row == 0 && indexPath.section == 0 {
            cell.isSelected = true
            indexPathDefault = indexPath
        }
        //  cell.layoutIfNeeded()
        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return baseViewModel.sectionViewModels.value.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionViewModel = baseViewModel.sectionViewModels.value[indexPath.section]
        let rowViewModel = sectionViewModel.rows[indexPath.row]
        if let rowViewModel = rowViewModel as? CellDidSelect {
            rowViewModel.didSelectedItem?()
        }

        if let indexPathDefault = indexPathDefault {
            let cellDeselected = collectionView.cellForItem(at: indexPathDefault)
            cellDeselected?.isSelected = false
            isSelectElementFirst = false
        }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let sectionViewModel = baseViewModel.sectionViewModels.value[indexPath.section]
        let rowViewModel = sectionViewModel.rows[indexPath.row]
        if let rowViewModel = rowViewModel as? CellDidDeselect {
            rowViewModel.didDeselectedItem?()
        }
    }
}
