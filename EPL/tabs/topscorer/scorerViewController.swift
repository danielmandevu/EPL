//
//  scorerViewController.swift
//  EPL
//
//  Created by daniel on 6/19/21.
//  Copyright © 2021 daniel. All rights reserved.
//

import UIKit

class player_class {
    var position:Int
    var player_name:String
    var club:String
    var total_g,home_g,away_g:Int
    var penalties:Int
    init(posit:Int,cl:String,player:String,total:Int,home:Int,away:Int,penalty:Int) {
        self.position = posit
        self.club = cl
        self.player_name = player
        self.total_g = total
        self.home_g = home
        self.away_g = away
        self.penalties = penalty
    }
}

class scorerViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var detailtable: UITableView!
    var detail:topscorer?
    var player_data = [player_class]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailtable.dataSource = self
        detailtable.delegate = self
        detailtable.register(one_playerTableViewCell.nib(), forCellReuseIdentifier: one_playerTableViewCell.id)
        let player_name = ((detail?.player.player_name)!)
        let club = ((detail?.team.team_name)!)
        let total_g = ((detail?.goals.overall)!)
        let home_g = ((detail?.goals.home)!)
        let away_g = ((detail?.goals.away)!)
        let pena = detail?.penalties
        let pos = ((detail?.pos)!)
        
        let player_info = player_class(posit:pos, cl: club, player: player_name, total: total_g, home: home_g, away: away_g, penalty: pena ?? 0)
        player_data.append(player_info)
        }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return player_data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailtable.dequeueReusableCell(withIdentifier: one_playerTableViewCell.id, for: indexPath) as! one_playerTableViewCell
        cell.configure(with: player_data[indexPath.row])
        return cell
    }
}

