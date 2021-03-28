//
//  CustomTextAreaView.swift
//  Ricipidian
//
//  Created by Minh Tâm on 28/03/2021.
//

import Foundation
import MaterialComponents
import RxCocoa
import RxSwift
import UIKit

class CustomTextAreaView: UIView {
    private let fontSize = CGFloat(15.0)
    private var textInput: MDCFilledTextArea!
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
        textInput = MDCFilledTextArea()
        textInput.height = 45
        tag = 1
        textInput.tag = 1
        textInput.translatesAutoresizingMaskIntoConstraints = false
        textInput.sizeToFit()
        textInput.textView.delegate = self
        textInput.placeholder = placeholder
        textInput.label.text = placeholder
        textInput.setNormalLabel(.gray, for: .normal)
        textInput.setUnderlineColor(.gray, for: .normal)
        textInput.setUnderlineColor(.gray, for: .editing)
        textInput.maximumNumberOfVisibleRows = 3
//        textInput.textView.clearButtonMode = .whileEditing
        textInput.textView.textColor = UIColor(hexString: "1A1E1F") ?? UIColor.black

        addSubview(textInput)

        textInput.snp.makeConstraints { view in
            view.top.bottom.leading.right.equalToSuperview().offset(0)
        }
    }

//    // MARK: - Create properties custom
//
    @IBInspectable var placeholder: String = "" {
        didSet {
            textInput.placeholder = placeholder
            textInput.label.text = placeholder
        }
    }

    @IBInspectable var textValue: String? {
        didSet {
            textInput.textView.text = textValue
        }
    }

    @objc func tapDone() {
        textInput.resignFirstResponder()
    }

    // MARK: - Bind to Text

    func bindToWithText(_ controlProperty: BehaviorRelay<String?>) {
        textInput.textView.bindToText(controlProperty).disposed(by: disposeBag)
    }

    public func subscribeText(onNext: ((String) -> Void)?) {
        textInput.textView.rx.text.orEmpty.observe(on: MainScheduler.instance).map { $0.trimmed }.subscribe(onNext: onNext, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }

    public func subscribeTextWithSkip(onNext: @escaping ((String) -> Void), _ skip: Int = 1) {
        textInput.textView.rx.text.orEmpty.observe(on: MainScheduler.instance).map { $0.trimmed }.skip(skip).subscribe(onNext: onNext, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }

    fileprivate func bindDataView(_ behaviorRelay: BehaviorRelay<String>) {
        textInput.textView.rx.text.orEmpty.bind(to: behaviorRelay).disposed(by: disposeBag)
    }

    fileprivate func bindToText(_ publishRelay: PublishRelay<String>) {
        textInput.textView.rx.text.orEmpty.bind(to: publishRelay).disposed(by: disposeBag)
    }

    func setText(_ text: String?) {
        textInput.textView.text = text
    }
}

extension CustomTextAreaView: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        textValue = textView.text
        textDidEndEditing.accept(textValue ?? "")
    }
}
