//
//  UITableView.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import UIKit

extension UITableView {
    func enableAutolayoutForCellHeights(estimatedRowHeight: CGFloat = 44) {
        self.estimatedRowHeight = estimatedRowHeight
        rowHeight = UITableView.automaticDimension
    }

    func registerTableViewCell(cellListName: [String]) {
        for cellName in cellListName {
            register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
        }
    }

    func registerHeaderFooterTableViewCell(cellListName: [String]) {
        for headerName in cellListName {
            register(UINib(nibName: headerName, bundle: nil), forHeaderFooterViewReuseIdentifier: headerName)
        }
    }

    func scrollToBottom() {
        DispatchQueue.main.async {
            let rowCount = self.numberOfRows(inSection: self.numberOfSections - 1)
            let indexPath = IndexPath(
                row: rowCount - 1,
                section: self.numberOfSections - 1)
            if rowCount > 0 {
                self.scrollToRow(at: indexPath, at: .bottom, animated: true)
            }
        }
    }
}
