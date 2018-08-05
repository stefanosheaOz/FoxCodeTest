//
//  HelperClasses.swift
//  FoxCodable
//
//  Created by Macbook Pro on 05/08/2018.
//  Copyright © 2018 stefanoshea. All rights reserved.
//

import UIKit


let gNavyColor = UIColor(red: 0.0, green: 38/255, blue: 67/255, alpha: 1)

enum StatType: String, Codable {
    case fantasyPoints  = "fantasy_points"
    case tackles        = "tackles"
    case runs           = "runs"
    case runMetres      = "run_metres"
}


class CustomImageView: UIImageView {
    var gestureRecogniser: GestureRecognizerWithData?
}

class GestureRecognizerWithData: UITapGestureRecognizer {
    var playerID: Int?
    var teamID: Int?
    var headshot: UIImage?
    var player: PlayerModel?
}

//MARK: TableView DataSource
extension ViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return stats.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return stats[section].type.rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stats[section].teamA.topPlayers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatTableViewCell", for: indexPath) as! StatTableViewCell
        
        let aTeamPlayer        = stats[indexPath.section].teamA.topPlayers[indexPath.row]
        let bTeamPlayer        = stats[indexPath.section].teamB.topPlayers[indexPath.row]
        
        cell.fillPlayerData(playerA: aTeamPlayer, playerB: bTeamPlayer)
        
        ws.getHeadShotForPlayer(withPlayerID: aTeamPlayer.id, completion: { headshot in
            cell.aPlayerImageView.image = headshot
            
            let aGesture        = GestureRecognizerWithData(target: self, action: #selector(self.playerImageTapped))
            aGesture.teamID     = self.stats.first?.teamA.teamID
            aGesture.headshot   = headshot
            aGesture.player = aTeamPlayer
            
            cell.aPlayerImageView.addGestureRecognizer(aGesture)
        })
        
        ws.getHeadShotForPlayer(withPlayerID: bTeamPlayer.id, completion: { headshot in
            cell.bPlayerImageView.image = headshot
            
            let bGesture        = GestureRecognizerWithData(target: self, action: #selector(self.playerImageTapped))
            bGesture.teamID     = self.stats.first?.teamB.teamID
            bGesture.headshot   = headshot
            bGesture.player     = bTeamPlayer
            
            cell.bPlayerImageView.addGestureRecognizer(bGesture )
        })
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}
