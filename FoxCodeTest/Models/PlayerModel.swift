//
//  Player.swift
//  FoxCodable
//
//  Created by Macbook Pro on 03/08/2018.
//  Copyright © 2018 stefanoshea. All rights reserved.
//

struct PlayerModel: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case name       = "short_name"
        case fullName   = "full_name"
        case number     = "jumper_number"
        case statValue  = "stat_value"
        case position, id
    }
    
    let name:       String
    let fullName:   String
    let number:     Int
    let statValue: Int
    let position:   String
    let id:         Int
}
