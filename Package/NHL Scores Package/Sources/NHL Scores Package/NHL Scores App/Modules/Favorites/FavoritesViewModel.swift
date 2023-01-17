//
//  File.swift
//  
//
//  Created by Ilxom on 14/01/23.
//

import Foundation

struct FavoritesViewModel {
    var homeTeam: String
    var awayTeam: String
    var homeTeamScore: Int16
    var awayTeamScore: Int16
}

extension FavoritesViewModel {
    init(from favoriteGame: FavoriteGame) {
        homeTeam = favoriteGame.homeTeam ?? "Home Team"
        awayTeam = favoriteGame.awayTeam ?? "Away Team"
        homeTeamScore = favoriteGame.homeTeamScore
        awayTeamScore = favoriteGame.awayTeamScore
    }
}
