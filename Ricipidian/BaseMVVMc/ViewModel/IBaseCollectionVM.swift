//
//  IBaseCollectionVM.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import RxSwift
import RxCocoa

class SectionKeyCollection {
    var headerTitle: String?
    var footerTitle: String?

    init(headerTitle: String? = nil, footerTitle: String? = nil) {
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
    }
}

protocol IBaseCollectionVM: class {
    var sectionViewModels: BehaviorRelay<[SectionViewModel]> { get }
    var disposeBag: DisposeBag { get }
    var listSectionViewModel: [SectionViewModel] { get set }
    var loadMoreAction: PublishRelay<Void> { get }
}

extension IBaseCollectionVM {

    func resetData() {
        listSectionViewModel = []
    }

    func removeRowOfSection(section: Int = 0, index: Int) {
        if section < listSectionViewModel.count {
            if index < listSectionViewModel[section].rows.count {
                listSectionViewModel[section].rows.remove(at: index)
            }
        }
    }

    func removeAllRowOfSection(_ section: Int) {
        if section < listSectionViewModel.count {
            listSectionViewModel[section].rows.removeAll()
        }
    }

    func getRowViewModel(section: Int, rowOfSection: Int) -> RowViewModel? {
        if self.sectionViewModels.value.count > section && self.sectionViewModels.value[section].rows.count > rowOfSection {
            let rowViewModel = self.sectionViewModels.value[section].rows[rowOfSection]
            return rowViewModel
        }
        return nil
    }

    func getRowViewModelFirst() -> RowViewModel? {
        return self.getRowViewModel(section: 0, rowOfSection: 0)
    }

    func getRowViewModelOfSection(_ section: Int) -> [RowViewModel]? {
        if self.sectionViewModels.value.count > section {
            let rowViewModel = self.sectionViewModels.value[section].rows
            return rowViewModel
        }
        return nil
    }

    func addRowWithSection(section: Int, rowViewModel: RowViewModel, headerTitle: String? = nil, footerTitle: String? = nil) {
        let sectionViewModel = listSectionViewModel.first { (item) -> Bool in
            return item.sectionKey == section
        }

        if let sectionViewModel = sectionViewModel {
            sectionViewModel.rows.append(rowViewModel)
        } else {
            listSectionViewModel.append(SectionViewModel(rows: [rowViewModel], headerTitle: headerTitle, footerTitle: footerTitle, sectionKey: section))
        }
    }

    func addRow(rowViewModel: RowViewModel, headerTitle: String? = nil, footerTitle: String? = nil) {
        let sectionViewModel = listSectionViewModel.first { (item) -> Bool in
            //return item.headerTitle == headerTitle
            return item.sectionKey == 0
        }

        if let sectionViewModel = sectionViewModel {
            sectionViewModel.rows.append(rowViewModel)
        } else {
            listSectionViewModel.append(SectionViewModel(rows: [rowViewModel], headerTitle: headerTitle, footerTitle: footerTitle))
        }
    }

    func addHeaderFooterForSection(section: Int, headerTitle: String? = nil, footerTitle: String? = nil, hasRow: Bool = true) {
        if section < listSectionViewModel.count && hasRow {
            listSectionViewModel[section].headerTitle = headerTitle
            listSectionViewModel[section].footerTitle = footerTitle
        }

        if !hasRow {
            let sectionViewModel = listSectionViewModel.first { (item) -> Bool in
                return item.sectionKey == section
            }

            if sectionViewModel == nil {
                listSectionViewModel.append(SectionViewModel(rows: [], headerTitle: headerTitle, footerTitle: footerTitle, sectionKey: section))
            }
        }
    }

    func addRows(_ rows: [RowViewModel]) {
        for row in rows {
            self.addRow(rowViewModel: row)
        }
    }

    func updateView() {
        sectionViewModels.accept(listSectionViewModel)
    }
}
