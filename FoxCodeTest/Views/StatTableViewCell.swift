//
//  TableViewCell.swift
//  FoxCodable
//
//  Created by Macbook Pro on 03/08/2018.
//  Copyright © 2018 stefanoshea. All rights reserved.
//

import UIKit

class StatTableViewCell: UITableViewCell {
    var nameLabel :UILabel!
    var descriptionLabel :UILabel!
    
    @IBOutlet weak var aPlayerImageView: CustomImageView!
    @IBOutlet weak var bPlayerImageView: CustomImageView!
    
    @IBOutlet weak var aPlayerScore: UILabel!
    @IBOutlet weak var bPlayerScore: UILabel!
    
    @IBOutlet weak var aPlayerName: UILabel!
    @IBOutlet weak var bPlayerName: UILabel!
    
    @IBOutlet weak var aPlayerNumberPosition: UILabel!
    @IBOutlet weak var bPlayerNumberPosition: UILabel!
    
    func fillPlayerData(playerA: PlayerModel, playerB: PlayerModel) {
        self.aPlayerName.text            = playerA.name
        self.aPlayerScore.text           = "\(playerA.statValue)"
        self.aPlayerNumberPosition.text  = String(playerA.number) + ". " + playerA.position

        self.bPlayerName.text            = playerB.name
        self.bPlayerScore.text           = "\(playerB.statValue)"
        self.bPlayerNumberPosition.text  = String(playerB.number) + ". " + playerB.position
        
        makeImageViewCircle(imageView: aPlayerImageView)
        makeImageViewCircle(imageView: bPlayerImageView)
    }
    
    func makeImageViewCircle(imageView: UIImageView) {
        imageView.layer.borderWidth     = 1.0
        imageView.layer.masksToBounds   = false
        imageView.layer.borderColor     = UIColor.black.cgColor
        imageView.layer.cornerRadius    = imageView.frame.size.width / 2
        imageView.clipsToBounds         = true
    }
//
//    func fillPlayerBData(player: Player) {
//        self.bPlayerName.text  = player.name
//        self.aPlayerScore.text = "\(player.statValue)"
//    }
    
    }
