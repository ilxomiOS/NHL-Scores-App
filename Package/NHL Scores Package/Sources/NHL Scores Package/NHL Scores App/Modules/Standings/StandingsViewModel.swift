//
//  File.swift
//  
//
//  Created by Ilxom on 10/01/23.
//

struct StandingsViewModel: Decodable {
    let key: String
    let name: String
    let wins: Int
    let losses: Int
}

extension StandingsViewModel {
    init(from team: Team) {
        self.key = team.key
        self.name = team.name
        self.wins = team.wins
        self.losses = team.losses
    }
}
