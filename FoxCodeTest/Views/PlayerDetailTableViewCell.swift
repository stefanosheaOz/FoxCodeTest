//
//  PlayerDetailTableViewCell.swift
//  FoxCodable
//
//  Created by Macbook Pro on 05/08/2018.
//  Copyright © 2018 stefanoshea. All rights reserved.
//

import UIKit

class PlayerDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var statValueLabel: UILabel!
    @IBOutlet weak var statTypeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
