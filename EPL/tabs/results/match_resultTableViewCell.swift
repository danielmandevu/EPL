//
//  match_resultTableViewCell.swift
//  EPL
//
//  Created by daniel on 3/12/21.
//  Copyright © 2021 daniel. All rights reserved.
//

import UIKit

class match_resultTableViewCell: UITableViewCell {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var home_team: UILabel!
    @IBOutlet weak var h_score: UILabel!
    @IBOutlet weak var a_score: UILabel!
    @IBOutlet weak var away_team: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static let identifier = "match_resultTableViewCell"
    static func nib()->UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    func configure(with model: fixture_data){
     
        
        guard model.status_code == 3 else{return}
        
        do{
            h_score.text = String(model.stats!.home_score)
            a_score.text = String(model.stats!.away_score)
            //time.text = model.match_start
        }
        
        
        let team_name = String(model.home_team.name)
        let team_nam = String(model.away_team.name)
        home_team.text = team_name
        away_team.text = team_nam


    }
    
}
