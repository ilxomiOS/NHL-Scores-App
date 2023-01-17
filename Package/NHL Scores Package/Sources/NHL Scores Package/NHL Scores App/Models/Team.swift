//
//  File.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

struct Team: Decodable {
    let key: String
    let name: String
    let wins: Int
    let losses: Int
    
    enum CodingKeys: String, CodingKey {
        case key = "Key"
        case name = "Name"
        case wins = "Wins"
        case losses = "Losses"
    }
}
