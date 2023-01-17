//
//  File.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import Foundation

protocol FavoritesPresenterProtocol: AnyObject {
    func viewDidLoad(view: FavoritesView)
    func deleteFavoriteGame(at index: Int)
}

final class FavoritesPresenter {
    weak var view: FavoritesViewProtocol?
    private let interactor: FavoritesInteractorProtocol
    
    private var favoritesGames = [FavoriteGame]()
    
    init(interactor: FavoritesInteractorProtocol) {
        self.interactor = interactor
    }
}

extension FavoritesPresenter: FavoritesPresenterProtocol {
    func viewDidLoad(view: FavoritesView) {
        self.view = view
        interactor.fetchFavoritesGames { [weak self] favoritesGames in
            guard let self = self,
                  let favoritesGames = favoritesGames
            else { return }
            self.favoritesGames = favoritesGames
            view.getFavoritesGames(favoritesGames: self.favoritesGames)
        }
    }
    
    func deleteFavoriteGame(at index: Int) {
        interactor.deleteFavoriteGame(favoritesGames[index])
    }
}
