//
//  BaseViewController.swift
//  Ricipidian
//
//  Created by Minh Tâm on 22/03/2021.
//

import Localize
import RxCocoa
import RxSwift
import UIKit

protocol IBaseViewController {
    func setupView()
    func bindViewModel()
    func bindViews()
}

// Base mô hình View k design theo storyboard StoryboardInstantiable
class BaseViewController: UIViewController, IBaseViewController {
    // MARK: - Properties

    let disposeBag = DisposeBag()
    var dismisAction: PublishRelay<Void> = PublishRelay<Void>()

    // MARK: - int + override

    override func viewDidLoad() {
        super.viewDidLoad()
        // initNavigationBar()
        modalPresentationStyle = .overFullScreen
        setNeedsStatusBarAppearanceUpdate()
        setupView()
        bindViews()
        bindViewModel()

        NotificationCenter.default.addObserver(self, selector: #selector(changeLanguage), name: NSNotification.Name(localizeChangeNotification), object: nil)

        changeLanguage()

        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(notification:)),
                                               name: UIResponder.keyboardDidShowNotification, object: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        dismisAction.accept(())
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // setNeedsStatusBarAppearanceUpdate()
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        let tableView = view.subviews.first(where: { $0 is UIScrollView }) as? UIScrollView
        tableView?.isScrollEnabled = false
    }

    @objc func keyboardDidShow(notification: NSNotification) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            let tableView = self.view.subviews.first(where: { $0 is UIScrollView }) as? UIScrollView
            tableView?.isScrollEnabled = true
        }
    }

    @objc func changeLanguage() {
        // Update language when have change
    }

    deinit {
        printLogMessage(" ------> Denit : \(String(describing: type(of: self)))")
    }

    func setupView() {
    }

    func bindViewModel() {
    }

    func bindViews() {
    }

    func subscribeLoading(_ viewModel: IBaseViewModel) {
        viewModel.isLoading.subscribeShort { _ in
        }.disposed(by: disposeBag)
    }

    func subscribeShowMessage(_ viewModel: IBaseViewModel) {
        viewModel.showMessageSuccess.subscribeShort { _ in

        }.disposed(by: disposeBag)

        viewModel.showMessageError.subscribeShort { _ in
        }.disposed(by: disposeBag)

        viewModel.showMessageValidate.subscribeShort { _ in
        }.disposed(by: disposeBag)
    }
}

extension BaseViewController {
    func subscribeCommon(viewModel: IBaseViewModel) {
        subscribeLoading(viewModel)
        subscribeShowMessage(viewModel)
    }

    func showMessage(title: String, subtitle: String, bannerStyle: BannerStyleMessage = .info) {
    }

    func initNavigationBar() {
    }
}

public enum BannerStyleMessage: Int {
    case danger
    case info
    case customView
    case success
    case warning
}
