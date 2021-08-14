//
//  fixture_detailViewController.swift
//  EPL
//
//  Created by daniel on 4/16/21.
//  Copyright © 2021 daniel. All rights reserved.
//

import UIKit

class fixture_detailViewController: UIViewController {
    
    var fixtureinfo:fixture_data?
    //var logtb_info:Standings?
    
    @IBOutlet weak var positon: UIStackView!
    @IBOutlet weak var club: UILabel!
    @IBOutlet weak var away_clubLabel: UILabel!
    @IBOutlet weak var pts: UILabel!
    @IBOutlet weak var logtable: UITableView!
    
    @IBOutlet weak var headto_head: UILabel!
    @IBOutlet weak var venueLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var home_team: UILabel!
    @IBOutlet weak var away_team: UILabel!
    
    @IBOutlet weak var home_tIMG: UIImageView!
    @IBOutlet weak var away_tIMG: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //club.text = "\((logtb_info?.home.won)!)"
//        away_clubLabel.text = "\((logtb_info?.team_id)!)"
        headto_head.textColor = .blue
        func game_time()->Date{
                let match_time = fixtureinfo?.match_start
                let form = DateFormatter()
                form.dateFormat = "y-MM-dd H:mm:ss"
                let this_date = form.date(from: match_time!)
                let mw_time = Calendar.current.date(byAdding: .hour, value: 2, to: this_date!)
                   //let to_string = form.string(from: mw_time!)
                return mw_time!
               }
               func time_yokha()->String{
                  let day = game_time()
                   let form = DateFormatter()
                   form.dateFormat = "H:mm"
                   let str_time = form.string(from: day)
                   return str_time
               }
               func date_yokha()->String{
                   let day = game_time()
                if Calendar.current.isDateInToday(game_time()){
                    return "Today"
                }
                else if Calendar.current.isDateInTomorrow(game_time()){
                    return "Tomorrow"
                }
                else if Calendar.current.isDateInYesterday(game_time()){
                    return "Yesterday"
                }
                else{
                    let form = DateFormatter()
                    form.dateFormat = "dd/MM"
                    let str_time = form.string(from: day)
                    return str_time
                }
               }
        func today()->Date{
            let lelo = Date()
            let form = DateFormatter()
            form.dateFormat = "y/MM/dd"
            let final = form.string(from: lelo)
            let dt = form.date(from: final)
            return dt!
        }
        timeLabel.text = time_yokha()
        dateLabel.text = date_yokha()
               
//        dateLabel.text = "(\(fixtureinfo?.match_start)!)"
//        timeLabel.text = "(\(fixtureinfo?.match_start)!)"
//
        home_team.text = "\((fixtureinfo?.home_team.name)!)"
        away_team.text = "\((fixtureinfo?.away_team.name)!)"
        
        let home_t = fixtureinfo?.home_team.logo
               if let h_team = try? Data(contentsOf: URL(string: home_t!)!){
                           self.home_tIMG.image = UIImage(data: h_team)
                       }
        let away_t = fixtureinfo?.away_team.logo
        if let a_team = try? Data(contentsOf: URL(string: away_t!)!){
                    self.away_tIMG.image = UIImage(data: a_team)
                }
        //venue (stadium)
        if fixtureinfo?.venue?.name == nil {
            venueLabel.text = "N/A"
        }
        else{venueLabel.text = "\((fixtureinfo?.venue?.name)!)"}
        
        
        
    }
  
    

   
}
