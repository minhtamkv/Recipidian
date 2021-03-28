//
//  CustomTextField.swift
//  Ricipidian
//
//  Created by Minh Tâm on 28/03/2021.
//

import Foundation
import MaterialComponents
import RxCocoa
import RxSwift
import UIKit

class CustomTextField: UIView {
    private let fontSize = CGFloat(15.0)
    private var textInput: MDCFilledTextField!
    let disposeBag = DisposeBag()
    let textDidEndEditing = PublishRelay<String>()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInputView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupInputView()
    }

    deinit {
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .gray
    }

    private func setupInputView() {
        if let _ = viewWithTag(1) { return }
        textInput = MDCFilledTextField()
        tag = 1
        textInput.tag = 1
        textInput.translatesAutoresizingMaskIntoConstraints = false
        textInput.delegate = self
        textInput.sizeToFit()
        textInput.placeholder = placeholder
        textInput.label.text = placeholder
        textInput.setNormalLabelColor(.gray, for: .normal)
        textInput.setUnderlineColor(.gray, for: .normal)
        textInput.setUnderlineColor(.gray, for: .editing)
        textInput.isSecureTextEntry = isSecurity
        textInput.clearButtonMode = .whileEditing
        textInput.textColor = UIColor(hexString: "1A1E1F") ?? UIColor.black

        addSubview(textInput)

        textInput.snp.makeConstraints { view in
            view.top.bottom.leading.right.equalToSuperview().offset(0)
        }
    }

    // MARK: - Create properties custom

    @IBInspectable var placeholder: String = "" {
        didSet {
            textInput.placeholder = placeholder
            textInput.label.text = placeholder
        }
    }

    @IBInspectable var isSecurity: Bool = false {
        didSet {
            textInput.isSecureTextEntry = isSecurity
            textInput.clearButtonMode = .whileEditing
        }
    }

    @IBInspectable var textValue: String? {
        didSet {
            textInput.text = textValue
        }
    }

    @objc func tapDone() {
        textInput.resignFirstResponder()
    }

    // MARK: - Bind to Text

    func bindToWithText(_ controlProperty: BehaviorRelay<String?>) {
        textInput.bindToText(controlProperty).disposed(by: disposeBag)
    }

    public func subscribeText(onNext: ((String) -> Void)?) {
        textInput.rx.text.orEmpty.observe(on: MainScheduler.instance).map { $0.trimmed }.subscribe(onNext: onNext, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }

    public func subscribeTextWithSkip(onNext: @escaping ((String) -> Void), _ skip: Int = 1) {
        textInput.rx.text.orEmpty.observe(on: MainScheduler.instance).map { $0.trimmed }.skip(skip).subscribe(onNext: onNext, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }

    fileprivate func bindDataView(_ behaviorRelay: BehaviorRelay<String>) {
        textInput.rx.text.orEmpty.bind(to: behaviorRelay).disposed(by: disposeBag)
    }

    fileprivate func bindToText(_ publishRelay: PublishRelay<String>) {
        textInput.rx.text.orEmpty.bind(to: publishRelay).disposed(by: disposeBag)
    }

    func setText(_ text: String?) {
        textInput.setText(text)
    }
}

extension CustomTextField: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        textValue = textField.text
        textDidEndEditing.accept(textValue ?? "")
    }
}
