//
//  PlayerViewModel.swift
//  FoxCodable
//
//  Created by Macbook Pro on 03/08/2018.
//  Copyright © 2018 stefanoshea. All rights reserved.
//

import Foundation

class PlayerViewModel : NSObject {
    
    let name: String
    let number: Int
    let position: String
    let id: Int
    let statValue: Int
    
    init(name: String, number: Int, position: String, id: Int, statValue: Int) {
        self.name       = name
        self.number     = number
        self.position   = position
        self.id         = id
        self.statValue  = statValue
    }
    
    init(player :PlayerModel) {
        self.name       = player.name
        self.number     = player.number
        self.position   = player.position
        self.id         = player.id
        self.statValue  = player.statValue
    }
}
