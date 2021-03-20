//
//  UIButton.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import RxCocoa
import RxSwift
import UIKit

extension UIButton {
    func subscribeTap(_ onNext: ((Void) -> Void)?) -> Disposable {
        return rx.tap.asDriver().drive(onNext: onNext, onCompleted: nil, onDisposed: nil)
    }

    func bindToWithTapAction(_ controlProperty: PublishRelay<Void>) -> Disposable {
        return rx.tap.bind(to: controlProperty)
    }
}
