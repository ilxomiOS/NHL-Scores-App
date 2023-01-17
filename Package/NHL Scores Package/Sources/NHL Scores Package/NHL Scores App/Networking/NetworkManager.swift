//
//  File.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import Foundation

protocol NetworkManagerProtocol: AnyObject {
    func fetchData<T: Decodable>(url: URL, completion: @escaping (Result<[T], NetworkingError>) -> Void)
}

final class NetworkManager {
    static let shared = NetworkManager()
    private init() { }
}

extension NetworkManager: NetworkManagerProtocol {
    
    func fetchData<T: Decodable>(url: URL, completion: @escaping (Result<[T], NetworkingError>) -> Void) {
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(.failure(.connectionError))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard
                let data = data,
                let newData = try? JSONDecoder().decode([T].self, from: data)
            else {
                completion(.failure(.invalidData))
                return
            }
            completion(.success(newData))
        }.resume()
    }
    
}
