//
//  File.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import Foundation

protocol StandingsInteractorProtocol {
    func fetchStandings(completion: @escaping ([Team]?) -> Void)
}

final class StandingsInteractor: StandingsInteractorProtocol {
    private let networking: NetworkManager
    
    init(networking: NetworkManager) {
        self.networking = networking
    }
    
    func fetchStandings(completion: @escaping ([Team]?) -> Void) {
        networking.fetchData(url: Endpoint.standings.url) { (result: Result<[Team], NetworkingError>) in
            switch result {
            case .success(let teams):
                DispatchQueue.main.async {
                    completion(teams)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print("Presenter: \(error.localizedDescription)")
                    completion(nil)
                }
            }
        }
    }
    
}
