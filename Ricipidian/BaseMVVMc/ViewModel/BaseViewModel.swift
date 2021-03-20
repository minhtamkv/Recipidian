//
//  BaseViewModel.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import RxSwift
import RxCocoa

protocol IBaseViewModel: class {
    var isLoading: PublishRelay<Bool> { get }
    var viewDidLoad: PublishRelay<Void> { get }
    var viewWillAppear: PublishRelay<Void> { get }
    var showMessageError: PublishRelay<String> { get }
    var showMessageSuccess: PublishRelay<String> { get }
    var showMessageValidate: PublishRelay<String> { get }
    var deinitAction: PublishRelay<String> { get }
}

class BaseViewModel: NSObject {
    var disposeBag: DisposeBag
    var isLoading: PublishRelay<Bool>
    var viewDidLoad: PublishRelay<Void>
    var viewWillAppear: PublishRelay<Void>
    var showMessageError: PublishRelay<String>
    var showMessageSuccess: PublishRelay<String>
    var showMessageValidate: PublishRelay<String>
    var deinitAction: PublishRelay<String>

    override init() {
        disposeBag = DisposeBag()
        isLoading = PublishRelay<Bool>()
        showMessageError = PublishRelay<String>()
        showMessageSuccess = PublishRelay<String>()
        showMessageValidate = PublishRelay<String>()
        viewDidLoad = PublishRelay<Void>()
        viewWillAppear = PublishRelay<Void>()
        deinitAction = PublishRelay<String>()
        super.init()
        self.makeSubcriptions()
    }

    // Thực hiện đăng ký subcribe các biến cần thiết trong hàm này
    func makeSubcriptions() {
    }
}
