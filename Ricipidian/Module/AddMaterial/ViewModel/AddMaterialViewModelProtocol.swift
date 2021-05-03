//
//  AddMaterialViewModelProtocol.swift
//  Ricipidian
//
//  Created by Minh Tâm on 03/05/2021.
//

import Foundation
import RxCocoa

protocol AddMaterialViewModelProtocol: IBaseCollectionVM, IBaseViewModel {
    var reloadTableView: PublishRelay<Void> { get set }
    var newRecipe: Recipe? { get set }
    var dismissAction: PublishRelay<Void> { get set }
    var nextAction: PublishRelay<Void> { get set }
}
