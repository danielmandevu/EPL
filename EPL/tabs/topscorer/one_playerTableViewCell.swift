//
//  one_playerTableViewCell.swift
//  EPL
//
//  Created by daniel on 6/20/21.
//  Copyright © 2021 daniel. All rights reserved.
//

import UIKit

class one_playerTableViewCell: UITableViewCell {

    @IBOutlet weak var posLabel: UILabel!
    @IBOutlet weak var name_player: UILabel!
    @IBOutlet weak var clubLabel: UILabel!
    @IBOutlet weak var overallLabel: UILabel!
    @IBOutlet weak var home_gLab: UILabel!
    @IBOutlet weak var away: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static let id = "one_playerTableViewCell"
    static func nib()->UINib{
        return UINib(nibName: id, bundle: nil)
    }
    func configure(with model: player_class){
        posLabel.text = String(model.position)
        name_player.text = model.player_name
        clubLabel.text = model.club
        overallLabel.text = String(model.total_g)
        home_gLab.text = String(model.home_g)
        away.text = String(model.away_g)
    }
    
}
