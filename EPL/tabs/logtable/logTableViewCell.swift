//
//  logTableViewCell.swift
//  EPL
//
//  Created by daniel on 2/28/21.
//  Copyright © 2021 daniel. All rights reserved.
//

import UIKit

class logTableViewCell: UITableViewCell {

    @IBOutlet weak var team_name: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var MP: UILabel!
    @IBOutlet weak var W: UILabel!
    @IBOutlet weak var D: UILabel!
    @IBOutlet weak var L: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static let identifier = "logTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    func configure(with model:Standings){
        let mp = String(model.overall.games_played)
        let W = String(model.overall.won)
        let D = String(model.overall.draw)
        let L = String(model.overall.lost)
        let pos = String("\(model.position).")
        let points = String(model.points)
        
        
        self.positionLabel.text = pos
        self.pointsLabel.text = points
        self.MP.text = mp
        self.W.text = W
        self.D.text = D
        self.L.text =  L
        
        var team_name = String(model.team_id)
        
        switch team_name {
        case "2522":
            team_name = "Arsenal"
        case "2509":
            team_name = "Liverpool"
        case "2512":
            team_name = "Sheffield"
        case "850":
            team_name = "Wolves"
        case "2513":
            team_name = "Burnley"
        case "2516":
            team_name = "Everton"
        case "2517":
            team_name = "Watford"
        case "2520":
            team_name = "Aston Villa"
        case "2523":
            team_name = "Manchester United"
        case "2524":
            team_name = "Chelsea"
        case "12400":
            team_name = "Manchester City"
        case "849":
            team_name = "Newcastle United"
        case "12423":
            team_name = "Southampton"
        case "2515":
            team_name = "Crystal Palace"
        case "2546":
            team_name = "Leeds"
        case "12295":
            team_name = "Tottenham"
        case "12401":
            team_name = "West Ham"
        case "12424":
            team_name = "Leicester"
        case "12294":
            team_name = "Fulham"
        case "2544":
            team_name = "West Brom"
        case "2518":
            team_name = "Brighton"
        default:
            team_name == team_name
        }
        self.team_name.text = team_name
        
    }
}
