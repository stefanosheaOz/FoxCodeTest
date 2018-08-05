//
//  PlayerDetailViewController.swift
//  FoxCodable
//
//  Created by Macbook Pro on 04/08/2018.
//  Copyright © 2018 stefanoshea. All rights reserved.
//

import UIKit

class PlayerDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberPositionLabel: UILabel!
    
    var image    = UIImage()
    let ws       = Webservice()
    
    var playerID = Int()
    var teamID   = Int()
    
    var player: PlayerModel!
    
    var usableStats = [String:Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
        playerID        = player.id
        
        nameLabel.text  = player.fullName
        numberPositionLabel.text = "\(player!.number)." + " " + player.position
        
        getPlayerStats()
    }

    func getPlayerStats() {
        
        self.view.makeToastActivity(.center)
        
        ws.getPlayerStats(forPlayer: playerID, forTeam: teamID, completion: { stats in
            
            for stat in stats {
                if !(stat.value is NSNull) {
                    
                    self.usableStats[stat.key] = stat.value as? Int
                }
            }
            self.usableStats = self.convertStats(withStats: self.usableStats)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
                self.view.hideToastActivity()
                self.checkError()
            }
        })
    }
    
    func convertStats(withStats: [String:Int]) -> [String:Int] {
        
        var newStats = [String:Int]()
        
        for stat in withStats {
            let key = stat.key
            let replacementKey = key.replacingOccurrences(of: "_", with: " ").capitalized
            
            newStats[replacementKey] = stat.value
        }
  
        return newStats
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usableStats.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? PlayerDetailTableViewCell
        
        let keyDict     = Array(usableStats.keys)
        let valueDict   = Array(usableStats.values)
        cell?.statTypeLabel.text    =  keyDict[indexPath.row]
        cell?.statValueLabel?.text  = String(valueDict[indexPath.row])
        
        return cell!
    }
    
    
    func checkError() {
        if usableStats.count == 0 {
            let ac = UIAlertController(title: "Sorry, No Stats Found", message: "We couldn't find any stats for this player's last game.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                self.navigationController?.popViewController(animated: true)
            }
            
            ac.addAction(okAction)
            
            self.present(ac, animated: true)
        }
    }
}
