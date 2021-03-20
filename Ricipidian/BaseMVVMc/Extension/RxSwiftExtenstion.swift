//
//  RxSwiftExtenstion.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import RxCocoa
import RxSwift

extension Observable {
    func isMain() -> Observable {
        return observeOn(MainScheduler.instance)
    }

    func subscribeShort(onNext: ((Element) -> Void)?, onError: ((Error) -> Void)? = nil) -> Disposable {
        return subscribe(onNext: onNext, onError: onError, onCompleted: nil, onDisposed: nil)
    }

    func subscribeShortOnMain(onNext: ((Element) -> Void)?, onError: ((Error) -> Void)? = nil) -> Disposable {
        return isMain()
            .subscribe(onNext: onNext, onError: onError, onCompleted: nil, onDisposed: nil)
    }
}

extension PublishRelay {
    public func subscribeShort(onNext: ((Element) -> Void)?) -> Disposable {
        return asObservable().subscribeShortOnMain(onNext: onNext)
    }
}

extension BehaviorRelay {
    public func subscribeShort(onNext: ((Element) -> Void)?) -> Disposable {
        return asObservable().subscribeShortOnMain(onNext: onNext)
    }

    public func subscribeShort(skip: Int, onNext: ((Element) -> Void)?) -> Disposable {
        return self.skip(skip).subscribeShortOnMain(onNext: onNext)
    }
}
