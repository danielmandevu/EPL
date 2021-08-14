//
//  topsTableViewCell.swift
//  EPL
//
//  Created by daniel on 4/13/21.
//  Copyright © 2021 daniel. All rights reserved.
//

import UIKit

class topsTableViewCell: UITableViewCell {

    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var player: UILabel!
    @IBOutlet weak var goals: UILabel!
    
    @IBOutlet weak var team_ya_player: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    static let tops_id = "topsTableViewCell"
    static func nib()->UINib{
        return UINib(nibName: tops_id, bundle: nil)
    }
    func configure(with model: topscorer) {
        let scorer = "\(model.player.player_name!)"
        let team = String(model.team.team_name!)
        let goals_scored = String(model.goals.overall!)
        let pos = String(model.pos)

        
        //team_ya_player.text = model.team.team_name
        position.text = pos
        player.text = scorer
        goals.text = goals_scored
        
    }
    
}
