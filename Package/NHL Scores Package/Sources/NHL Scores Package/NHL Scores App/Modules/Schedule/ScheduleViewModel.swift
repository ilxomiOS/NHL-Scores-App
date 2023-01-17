//
//  File.swift
//  
//
//  Created by Ilxom on 13/01/23.
//

import Foundation

struct ScheduleViewModel {
    let homeTeam, awayTeam: String
    let awayTeamScore, homeTeamScore: Int?
    let status: String
    let dateTime: String?
}

extension ScheduleViewModel {
    init(from games: Game) {
        self.homeTeam = games.homeTeam
        self.awayTeam = games.awayTeam
        self.homeTeamScore = games.homeTeamScore
        self.awayTeamScore = games.awayTeamScore
        self.status = games.status
        self.dateTime = games.dateTime
    }
}
