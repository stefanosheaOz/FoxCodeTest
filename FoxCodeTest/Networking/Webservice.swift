//
//  Webservice.swift
//  FoxCodable
//
//  Created by Macbook Pro on 03/08/2018.
//  Copyright © 2018 stefanoshea. All rights reserved.
//

import Foundation
import UIKit

class Webservice {
    
    private let dataSourceURL = URL(string: "https://statsapi.foxsports.com.au/3.0/api/sports/league/matches/NRL20172101/topplayerstats.json;type=fantasy_points;type=tackles;type=runs;type=run_metres?limit=5&userkey=A00239D3-45F6-4A0A-810C-54A347F144C2")!

    func getData(completion :@escaping ([StatModel]) -> ()){
        URLSession.shared.dataTask(with: dataSourceURL) { data, _, _ in
            
            if let data = data {
                
                let result = try! JSONDecoder().decode(Array<StatModel>.self, from: data)
                
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            
            }.resume()
    }
    
    func getHeadShotForPlayer(withPlayerID ID: Int, completion :@escaping (UIImage) -> ()) {
        let imageDataSourceURL = URL(string: "https://media.foxsports.com.au/match-centre/includes/images/headshots/landscape/nrl/\(ID).jpg")!
        let blankHeadshotURL    = URL(string: "https://media.foxsports.com.au/match-centre/includes/images/headshots/headshot-blank-large.jpg")!
        var returnImage: UIImage!
        
        URLSession.shared.dataTask(with: imageDataSourceURL) { data, _, _ in
            
            if let data = data {
                
                if let image = UIImage(data: data) {
                    returnImage = image
                    
                    DispatchQueue.main.async {
                        completion(returnImage)
                    }
                } else {
                    URLSession.shared.dataTask(with: blankHeadshotURL) { data, _, _ in
                        if let data = data {
                            if let image = UIImage(data: data) {
                                returnImage = image
                                
                                DispatchQueue.main.async {
                                    completion(returnImage)
                                }
                            }
                        }
                    }.resume()
                }
            }
        }.resume()
    }
    
    func getPlayerStats(forPlayer playerID: Int, forTeam teamID: Int, completion :@escaping ([String:Any]) -> ()) {
        let sourceURL = URL(string: "https://statsapi.foxsports.com.au/3.0/api/sports/league/series/1/seasons/115/teams/\(teamID)/players/\(playerID)/detailedstats.json?&userkey=9024ec15-d791-4bfd-aa3b-5bcf5d36da4f")!
        
        URLSession.shared.dataTask(with: sourceURL) { data, _, _ in
            if let data = data {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
                
                if let lastMatch = json?["last_match_stats"] as? [String:Any] {
                    DispatchQueue.main.async {
                        completion(lastMatch)
                    }
                }
            }
        }.resume()
    }
    
    func getBlankHeadShot(completion :@escaping ( UIImage) -> ()) {
        let url = URL(string: "http://media.foxsports.com.au/match-centre/includes/images/headshots/headshot-blank-large.jpg")!
        
        var returnImage: UIImage!
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                
                if let image = UIImage(data: data) {
                    returnImage = image
                    
                    DispatchQueue.main.async {
                        completion(returnImage)
                    }
                }
            }
        }.resume()
    }
}
