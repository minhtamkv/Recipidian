//
//  RecipeListViewModelProtocol.swift
//  Ricipidian
//
//  Created by Minh Tâm on 25/03/2021.
//

import Foundation
import RxCocoa

protocol RecipeListViewModelProtocol: IBaseCollectionVM, IBaseViewModel {
    var showAddRecipe: PublishRelay<Void> { get set }
}
