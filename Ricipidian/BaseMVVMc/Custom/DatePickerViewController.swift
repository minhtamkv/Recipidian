//
//  DatePickerViewController.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import UIKit

final class DatePickerViewController: UIViewController {

    public typealias Action = (Date) -> Void

    fileprivate var action: Action?

    fileprivate lazy var datePicker: UIDatePicker = { [unowned self] in
        $0.addTarget(self, action: #selector(DatePickerViewController.actionForDatePicker), for: .valueChanged)
        return $0
    }(UIDatePicker())

    required init(mode: UIDatePicker.Mode, date: Date? = nil, minimumDate: Date? = nil, maximumDate: Date? = nil, local: Locale? = nil, action: Action?) {
        super.init(nibName: nil, bundle: nil)
        datePicker.datePickerMode = mode
        datePicker.date = date ?? Date()
        datePicker.minimumDate = minimumDate
        datePicker.maximumDate = maximumDate
        datePicker.locale = local
        self.action = action
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("Deinit DatePicker")
    }

    override func loadView() {
        view = datePicker
    }

    @objc func actionForDatePicker() {
        action?(datePicker.date)
    }

    public func setDate(_ date: Date) {
        datePicker.setDate(date, animated: true)
    }
}
