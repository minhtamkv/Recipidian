//
//  SectionViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import Foundation

class SectionViewModel {
    var rows: [RowViewModel] = [RowViewModel]()
    var headerTitle: String?
    var footerTitle: String?
    let sectionKey: Int

    init(rows: [RowViewModel], headerTitle: String? = nil, footerTitle: String? = nil, sectionKey: Int = 0) {
        self.rows = rows
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
        self.sectionKey = sectionKey
    }

    init(headerTitle: String? = nil, footerTitle: String? = nil, sectionKey: Int = 0) {
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
        self.sectionKey = sectionKey
    }
}
