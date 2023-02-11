//
//  File.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import Foundation

protocol FavoritesInteractorProtocol: AnyObject { // слово protocol не используется FavoritesService
    func fetchFavoritesGames(completion: @escaping ([FavoriteGame]?) -> Void)
    func deleteFavoriteGame(_ game: FavoriteGame)
}

final class FavoritesInteractor {
    private let storage: CoreDataManager
    
    init(storage: CoreDataManager) {
        self.storage = storage
    }
}

extension FavoritesInteractor: FavoritesInteractorProtocol {
    func fetchFavoritesGames(completion: @escaping ([FavoriteGame]?) -> Void) { // completion не используем, есть Result
         // либо используй технологию async await
        storage.fetchFavoritesGames { (result: Result<[FavoriteGame], Error>) in
            switch result {
            case .success(let favoritesGames):
                DispatchQueue.main.async {
                    completion(favoritesGames)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print("Presenter: \(error.localizedDescription)")
                    completion(nil)
                }
            }
        }
    }
    
    func deleteFavoriteGame(_ game: FavoriteGame) {
        storage.deleteFavoriteGame(game)
    }
}
