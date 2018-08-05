//
//  Stat.swift
//  FoxCodable
//
//  Created by Macbook Pro on 03/08/2018.
//  Copyright © 2018 stefanoshea. All rights reserved.
//

struct StatModel: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case teamA = "team_A"
        case teamB = "team_B"
        case type = "stat_type"
    }
    
    let type: StatType
    let teamA : TeamModel
    let teamB : TeamModel
}
