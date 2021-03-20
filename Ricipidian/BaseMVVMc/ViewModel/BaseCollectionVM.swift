//
//  BaseCollectionVM.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import Foundation
import RxSwift
import RxCocoa

private let PAGESIZE_LOADMORE_DEFAULT = 10

class BaseCollectionVM: BaseViewModel, IBaseCollectionVM {
    var sectionViewModels: BehaviorRelay<[SectionViewModel]>
    var listSectionViewModel: [SectionViewModel]
    var loadMoreAction: PublishRelay<Void>

    // Param loadmore
    var pageSize = PAGESIZE_LOADMORE_DEFAULT
    var startrecord = 0
    var hasLoadMore = false
    var canLoadMore = true
    var offsetStartLoadmore = 0
    var isLoadFirst = true

    override init() {
        sectionViewModels = BehaviorRelay<[SectionViewModel]>(value: [])
        listSectionViewModel = [SectionViewModel]()
        loadMoreAction = PublishRelay<Void>()
        super.init()
        self.configLoadMore()
    }

    func configLoadMore() {
        self.pageSize = PAGESIZE_LOADMORE_DEFAULT
        self.hasLoadMore = true // 1. Setup tableview có dùng loadmore
        self.offsetStartLoadmore = 0 // 2. Phần tử loadmore bắt đầu từ vị trí  offsetStartLoadmore
    }

    func resetData() {
        listSectionViewModel = []
        isLoadFirst = true
        canLoadMore = true
    }

    func calculateLoadMore() {
        self.startrecord = 0
        if isLoadFirst {
            return
        }

        if self.hasLoadMore {
            for section in listSectionViewModel {
                startrecord += section.rows.count
            }

            startrecord = startrecord - offsetStartLoadmore
            printLogMessage("Startrecord: \(startrecord)")
        }
    }

    func checkLoadmore(_ listPageData: [Any]) {
        if listPageData.count > 0 {
            isLoadFirst = false
        }

        if listPageData.count < self.pageSize {
            self.canLoadMore = false
        }
    }
}

extension BaseCollectionVM {
    func appendParamLoadMore (params: [String: Any]) -> [String: Any] {
        var paramsVar = params
        paramsVar["startrecord"] = startrecord
        paramsVar["pagesize"] = pageSize
        return paramsVar
    }
}
