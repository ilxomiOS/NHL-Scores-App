//
//  File.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

struct Game: Decodable {
    let homeTeam, awayTeam: String
    let awayTeamScore, homeTeamScore: Int?
    let status: String
    let dateTime: String?
    
    enum CodingKeys: String, CodingKey {
        case homeTeam = "HomeTeam"
        case awayTeam = "AwayTeam"
        case awayTeamScore = "AwayTeamScore"
        case homeTeamScore = "HomeTeamScore"
        case status = "Status"
        case dateTime = "DateTime"
    }
}
