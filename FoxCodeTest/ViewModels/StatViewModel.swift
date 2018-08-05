//
//  StatViewModel.swift
//  FoxCodable
//
//  Created by Macbook Pro on 03/08/2018.
//  Copyright © 2018 stefanoshea. All rights reserved.
//
import Foundation

class StatViewModel : NSObject {
    
    let type: StatType
    let teamA : TeamModel
    let teamB : TeamModel
    
    init(type : StatType, teamA: TeamModel, teamB: TeamModel) {
        self.type  = type
        self.teamA = teamA
        self.teamB = teamB
    }
    
    init(stat :StatModel) {
        self.type  = stat.type
        self.teamA = stat.teamA
        self.teamB = stat.teamB
    }
}
