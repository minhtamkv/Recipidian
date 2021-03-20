//
//  UITextField.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import Localize
import RxCocoa
import RxSwift
import SwifterSwift
import UIKit

extension UITextField {
    func setInputViewDatePicker(target: Any, selector: Selector, maximumDate: Date? = nil, minimumDate: Date? = nil, mode: UIDatePicker.Mode = .date) {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216)) // 1
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        datePicker.datePickerMode = mode // 2
        datePicker.locale = Locale(identifier: Localize.currentLanguage)

        if let max = maximumDate {
            datePicker.maximumDate = max
        }
        if let min = minimumDate {
            datePicker.minimumDate = min
        }
        inputView = datePicker // 3

        // Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Close".localized, style: .plain, target: nil, action: #selector(tapCancel))
        let barButton = UIBarButtonItem(title: "Done".localized, style: .plain, target: target, action: selector)
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        inputAccessoryView = toolBar
    }

    @objc func tapCancel() {
        resignFirstResponder()
    }

    func setText(_ text: String?) {
        self.text = text
        sendActions(for: .valueChanged)
    }

    func subscribeText(_ onNext: ((String) -> Void)?, _ skip: Int = 0) -> Disposable {
        return rx.text.orEmpty.subscribe(on: MainScheduler.instance).map { $0.trimmed }.skip(skip).subscribe(onNext: onNext, onError: nil, onCompleted: nil, onDisposed: nil)
    }

    func bindToText(_ controlProperty: BehaviorRelay<String?>) -> Disposable {
        return rx.text.orEmpty.bind(to: controlProperty)
    }

    func bindToText(_ controlProperty: BehaviorRelay<String>) -> Disposable {
        return rx.text.orEmpty.bind(to: controlProperty)
    }
}
