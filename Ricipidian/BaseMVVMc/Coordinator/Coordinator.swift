//
//  Coordinator.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import UIKit
import RxSwift
import RxCocoa

protocol Coordinator: AnyObject {
    var navigation: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }

    func start()
    func coordinate (to coordinator: Coordinator)
    func didFinish(coordinator: Coordinator)
    var data: Any? { get set }
    var dismisVCAction: PublishRelay<Void> { get }
}

extension Coordinator {
    func coordinate (to coordinator: Coordinator) {
        coordinator.start()
    }
}

class BaseCoordinator: Coordinator {
    var disposeBag = DisposeBag()
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigation: UINavigationController
    var data: Any?
    
    lazy var dismisVCAction: PublishRelay<Void> = {
        return PublishRelay<Void>()
    }()

    init() {
        navigation = UINavigationController(rootViewController: UIViewController())
    }

    init(_ navigationController: UINavigationController = UINavigationController()) {
        navigation = navigationController
    }

    func start() {
        fatalError("Start method must be implemented")
    }

    func coordinate (to coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.data = self.data
        coordinator.start()
    }

    func didFinish(coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}
