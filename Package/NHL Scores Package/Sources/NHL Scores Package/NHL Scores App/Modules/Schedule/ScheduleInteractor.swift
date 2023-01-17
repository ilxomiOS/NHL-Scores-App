//
//  File.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import Foundation

protocol ScheduleInteractorProtocol: AnyObject {
    func fetchShedule(day: DateCategory, completion: @escaping ([Game]?) -> Void)
    func save(game: ScheduleViewModel)
}

final class ScheduleInteractor: ScheduleInteractorProtocol {
    private let networking: NetworkManager
    private let storage: CoreDataManager
    
    init(networking: NetworkManager, storage: CoreDataManager) {
        self.networking = networking
        self.storage = storage
    }
    
    func fetchShedule(day: DateCategory, completion: @escaping ([Game]?) -> Void) {
        networking.fetchData(url: Endpoint.shedule(day: day).url) { (result: Result<[Game], NetworkingError>) in
            switch result {
            case .success(let game):
                DispatchQueue.main.async {
                    completion(game)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print("Presenter: \(error.localizedDescription)")
                    completion(nil)
                }
            }
        }
    }
    
    func save(game: ScheduleViewModel) {
        storage.save(game)
    }
}
