//
//  UICollectionView.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import UIKit

extension UICollectionView {
    func registerCollectionViewCell(cellListName: [String]) {
        for cellName in cellListName {
            register(UINib(nibName: cellName, bundle: nil), forCellWithReuseIdentifier: cellName)
        }
    }

    func registerForElementKindSectionHeader(cellListName: [String]) {
        for cellName in cellListName {
            register(UINib(nibName: cellName, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: cellName)
        }
    }

    func registerForElementKindSectionFooter(cellListName: [String]) {
        for cellName in cellListName {
            register(UINib(nibName: cellName, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: cellName)
        }
    }
}
