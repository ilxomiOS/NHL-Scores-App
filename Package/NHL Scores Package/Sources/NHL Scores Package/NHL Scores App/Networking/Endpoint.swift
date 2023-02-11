//
//  File.swift
//  
//
//  Created by Ilxom on 10/01/23.
//

import Foundation

struct Endpoint {
    var path: String // если структура то лучше использовать let иначе структура не имеет смысла
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.sportsdata.io"
        components.path = "/v3/nhl/scores/json/" + path
        components.queryItems = [URLQueryItem(name: "key", value: "5febdab097d343f7abacf8584f1ff778")]
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
}

extension Endpoint {
    static func shedule(day: DateCategory) -> Self {
        let formattedDate = DateHelper.getDateString(day: day)
        return Endpoint(path: "GamesByDate/\(formattedDate)")
    }
    
    static var standings: Self {
        let year = DateHelper.getYearString()
        return Endpoint(path: "Standings/\(year)")
    }
}
