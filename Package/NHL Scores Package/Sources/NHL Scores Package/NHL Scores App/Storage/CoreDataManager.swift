//
//  File.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import CoreData

protocol CoreDataManagerProtocol: AnyObject {
    func save(_ game: ScheduleViewModel)
    func fetchFavoritesGames(completion: (Result<[FavoriteGame], Error>) -> Void)
    func deleteFavoriteGame(_ game: FavoriteGame)
}

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private lazy var viewContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    private init() {}
    
    private lazy var persistentContainer: NSPersistentContainer = {
        guard let modelURL = Bundle.module.url(forResource: "FavoriteGame", withExtension: "momd"),
              let model = NSManagedObjectModel(contentsOf: modelURL) else { return NSPersistentContainer() }
        
        let container = NSPersistentContainer(name: "FavoriteGame", managedObjectModel: model)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private func saveContext () {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

extension CoreDataManager: CoreDataManagerProtocol {
    func save(_ game: ScheduleViewModel) {
        let favoriteGame = FavoriteGame(context: viewContext)
        
        favoriteGame.homeTeam = game.homeTeam
        favoriteGame.awayTeam = game.awayTeam
        
        
        if let homeTeamScore = game.homeTeamScore, let awayTeamScore = game.awayTeamScore {
            favoriteGame.homeTeamScore = Int16(homeTeamScore)
            favoriteGame.awayTeamScore = Int16(awayTeamScore)
        }
        
        saveContext()
    }
    
    func fetchFavoritesGames(completion: (Result<[FavoriteGame], Error>) -> Void) {
        let fetchRequest = FavoriteGame.fetchRequest()
        do {
            let favoriteGamesArray = try viewContext.fetch(fetchRequest)
            completion(.success(favoriteGamesArray))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    func deleteFavoriteGame(_ game: FavoriteGame) {
        viewContext.delete(game)
        saveContext()
    }
    
}
