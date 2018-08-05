//
//  ViewController.swift
//  FoxCodable
//
//  Created by Macbook Pro on 03/08/2018.
//  Copyright © 2018 stefanoshea. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var stats   = [StatModel]()
    let ws      = Webservice()
    
    var selectedPlayerID: Int?
    var selectedTeamID: Int?
    var selectedPlayerImage: UIImage?
    
    var player: PlayerModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadStats()
        
        let image = #imageLiteral(resourceName: "Fox_League2")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        
        self.navigationItem.titleView = imageView
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 60))
        
        var title = String()
        
        switch stats[section].type {
        case .fantasyPoints:
            title = "Fantasy Points"
        case .runMetres:
            title = "Run Metres"
        case .runs:
            title = "Runs"
        case .tackles:
            title = "Tackles"
        }
        
        let label           = UILabel(frame: view.frame)
        label.frame.origin.x    = 15.0
        label.text              = title
        label.font              = UIFont(name: "Helvetica Neue", size: 24.0)
        label.textColor         = .white
        view.backgroundColor    = gNavyColor
        
        view.addSubview(label)
        	
        return view
    }

    func downloadStats() {
       
        ws.getData(completion: { stats in
            self.stats = stats
            self.tableView.reloadData()
        })
    }
 

    @objc func playerImageTapped(_ sender: GestureRecognizerWithData) {
        selectedTeamID      = sender.teamID
        selectedPlayerImage = sender.headshot
        player              = sender.player
       
        self.performSegue(withIdentifier: "showPlayerDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let vc = segue.destination as? PlayerDetailViewController {
            vc.teamID   = self.selectedTeamID!
            vc.image    = self.selectedPlayerImage!
            vc.player   = self.player!
        }
    }
}
