//
//  File.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import Foundation

final class FavoritesBuilder {
    static func build() -> FavoritesViewController {
        let storage = CoreDataManager.shared
        let interactor = FavoritesInteractor(storage: storage)
        let presenter = FavoritesPresenter(interactor: interactor)
        let viewController = FavoritesViewController(presenter: presenter)
        
        presenter.view = viewController.favoritesView
        
        return viewController
    }
}
