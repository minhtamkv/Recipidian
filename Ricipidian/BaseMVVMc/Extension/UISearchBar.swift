//
//  UISearchBar.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import RxCocoa
import RxSwift
import UIKit

extension UISearchBar {
    func bindToText(_ controlProperty: BehaviorRelay<String?>) -> Disposable {
        return rx.text.orEmpty.bind(to: controlProperty)
    }

    func bindToText(_ controlProperty: BehaviorRelay<String>) -> Disposable {
        return rx.text.orEmpty.bind(to: controlProperty)
    }

    func searchButtonClicked(_ controlProperty: PublishRelay<Void>) -> Disposable {
        return rx.searchButtonClicked.bind(to: controlProperty)
    }

    func textDidEndEditing(_ controlProperty: PublishRelay<Void>) -> Disposable {
        return rx.textDidEndEditing.bind(to: controlProperty)
    }
}
