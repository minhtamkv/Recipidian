//
//  UITextView.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import RxCocoa
import RxSwift
import UIKit

extension UITextView {
    func bindToText(_ controlProperty: BehaviorRelay<String?>) -> Disposable {
        return rx.text.orEmpty.bind(to: controlProperty)
    }

    func bindToText(_ controlProperty: BehaviorRelay<String>) -> Disposable {
        return rx.text.orEmpty.bind(to: controlProperty)
    }
}
