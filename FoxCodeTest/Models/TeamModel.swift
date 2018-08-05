//
//  File.swift
//  FoxCodable
//
//  Created by Macbook Pro on 03/08/2018.
//  Copyright © 2018 stefanoshea. All rights reserved.
//

struct TeamModel: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case teamID     = "id"
        case topPlayers = "top_players"
        case teamName   = "short_name"
    }
    
    let teamID: Int
    let teamName: String
    let topPlayers : [PlayerModel]
}
