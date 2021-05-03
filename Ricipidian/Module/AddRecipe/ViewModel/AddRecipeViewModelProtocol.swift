//
//  AddRecipeViewModelProtocol.swift
//  Ricipidian
//
//  Created by Minh Tâm on 27/03/2021.
//

import Foundation
import RxCocoa

protocol AddRecipeViewModelProtocol: IBaseCollectionVM, IBaseViewModel {
    var reloadTableView: PublishRelay<Void> { get set }
    var newRecipe: Recipe? { get set }
    var dismissAction: PublishRelay<Void> { get set }
    var nextAction: PublishRelay<Void> { get set }
}
