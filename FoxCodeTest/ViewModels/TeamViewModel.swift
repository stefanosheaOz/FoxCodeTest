//
//  TeamViewModel.swift
//  FoxCodable
//
//  Created by Macbook Pro on 03/08/2018.
//  Copyright © 2018 stefanoshea. All rights reserved.
//

import Foundation

class TeamViewModel : NSObject {
    
    let teamID: Int
    let teamName: String
    let topPlayers : [PlayerModel]
    
    init(teamID :Int, teamName: String, topPlayers: [PlayerModel]) {
        self.teamID     = teamID
        self.teamName   = teamName
        self.topPlayers = topPlayers
    }
    
    init(team :TeamModel) {
        self.teamID     = team.teamID
        self.teamName   = team.teamName
        self.topPlayers = team.topPlayers
    }
}
