//
//  fixtureTableViewCell.swift
//  EPL
//
//  Created by daniel on 3/10/21.
//  Copyright © 2021 daniel. All rights reserved.
//

import UIKit

class fixtureTableViewCell: UITableViewCell {
    @IBOutlet weak var home_team: UILabel!
    @IBOutlet weak var away_team: UILabel!
    @IBOutlet weak var start_time: UILabel!
    
    //@IBOutlet weak var date_label: UILabel! //remove this after all the work daniel
    @IBOutlet weak var home_logo: UIImageView!
    @IBOutlet weak var away_logo: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static let fix_id = "fixtureTableViewCell"
    static func nib() ->UINib{
        return UINib(nibName: fix_id, bundle: nil)
    }
    func configure(with model: fixture_data){
        //home_team.translatesAutoresizingMaskIntoConstraints = false
        func game_time()->Date{
            let match_time = model.match_start
            let form = DateFormatter()
            form.dateFormat = "y-MM-dd H:mm:ss"
            let this_date = form.date(from: match_time)
            let mw = Calendar.current.date(byAdding: .hour, value: 2, to: this_date!)
            //let to_string = form.string(from: mw_time!)
            //let sorted_t =
            return mw!
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
            let form = DateFormatter()
            form.dateFormat = "dd/MM/y"
            let str_time = form.string(from: day)
            return str_time
        }
        start_time.text = time_yokha()
        //date_label.text = date_yokha() // this is another to be removed
        
        let home_t = model.home_team.logo
        if let h_team = try? Data(contentsOf: URL(string: home_t!)!){
                    self.home_logo.image = UIImage(data: h_team)
                }
        let away_t = model.away_team.logo
        if let a_team = try? Data(contentsOf: URL(string: away_t!)!){
            self.away_logo.image = UIImage(data: a_team)
        }
        //apa zandivuta nde i will repeat myself sure...
        var team_names = model.home_team.name
            
        func home_team_name()->String{
            switch team_names {
            case team_names where team_names.hasPrefix("West Bromwich Albion"):
                team_names = "West Bromwich"
            case team_names where team_names.hasPrefix("Brighton & Hove Albion"):
                team_names = "Brighton"
            case team_names where team_names.hasPrefix("Manchester United"):
                team_names = "Man United"
            case team_names where team_names.hasPrefix("Manchester City"):
                team_names = "Man City"
            case team_names where team_names.hasPrefix("Newcastle United"):
                team_names = "Newcastle"
            case team_names where team_names.hasPrefix("Wolverhampton Wanderers"):
                team_names = "Wolves"
            case team_names where team_names.hasPrefix("Liverpool FC"):
                team_names = "Liverpool"
            case team_names where team_names.hasPrefix("Norwich City"):
                team_names = "Norwich"
            case team_names where team_names.hasPrefix("Fulham FC"):
                team_names = "Fulham"
            case team_names where team_names.hasPrefix("Sheffield United"):
                team_names = "Sheffield"
            case team_names where team_names.hasPrefix("Burnley FC"):
                team_names = "Burnley"
            case team_names where team_names.hasPrefix("Crystal Palace"):
                team_names = "Crystal Palace"
            case team_names where team_names.hasPrefix("Everton FC"):
                team_names = "Everton"
//            case team_names where team_names.hasPrefix("Watford FC"):
//                team_names = "Watford"
            case team_names where team_names.hasPrefix("Aston Villa"):
                team_names = "Aston Villa"
            case team_names where team_names.hasPrefix("Arsenal FC"):
                team_names = "Arsenal"
            case team_names where team_names.hasPrefix("Chelsea FC"):
                team_names = "Chelsea"
            case team_names where team_names.hasPrefix("Leeds United"):
                team_names = "Leeds"
            case team_names where team_names.hasPrefix("Tottenham Hotspur"):
                team_names = "Tottenham"
            case team_names where team_names.hasPrefix("West Ham United"):
                team_names = "West Ham"
            case team_names where team_names.hasPrefix("Southampton FC"):
                team_names = "Southampton"
            default:
                team_names == team_names
            }
            
            return team_names
        }
        func away_team_name()->String{
            var team_name = model.away_team.name
            switch team_name {
            case team_name where team_name.hasPrefix("West Bromwich Albion"):
                team_name = "West Bromwich"
            case team_name where team_name.hasPrefix("Brighton & Hove Albion"):
                team_name = "Brighton"
            case team_name where team_name.hasPrefix("Manchester United"):
                team_name = "Man United"
            case team_name where team_name.hasPrefix("Manchester City"):
                team_name = "Man City"
            case team_name where team_name.hasPrefix("Newcastle United"):
                team_name = "Newcastle"
            case team_name where team_name.hasPrefix("Wolverhampton Wanderers"):
                team_name = "Wolves"
            case team_name where team_name.hasPrefix("Liverpool FC"):
                team_name = "Liverpool"
            case team_name where team_name.hasPrefix("Norwich City"):
                team_name = "Norwich"
            case team_name where team_name.hasPrefix("Fulham FC"):
                team_name = "Fulham"
            case team_name where team_name.hasPrefix("Sheffield United"):
                team_name = "Sheffield"
            case team_name where team_name.hasPrefix("Burnley FC"):
                team_name = "Burnley"
            case team_name where team_name.hasPrefix("Crystal Palace"):
                team_name = "Crystal Palace"
            case team_name where team_name.hasPrefix("Everton FC"):
                team_name = "Everton"
            case team_name where team_name.hasPrefix("Watford FC"):
                team_name = "Watford"
            case team_name where team_name.hasPrefix("Aston Villa"):
                team_name = "Aston Villa"
            case team_name where team_name.hasPrefix("Arsenal FC"):
                team_name = "Arsenal"
            case team_name where team_name.hasPrefix("Chelsea FC"):
                team_name = "Chelsea"
            case team_name where team_name.hasPrefix("Leeds United"):
                team_name = "Leeds"
            case team_name where team_name.hasPrefix("Tottenham Hotspur"):
                team_name = "Tottenham"
            case team_name where team_name.hasPrefix("West Ham United"):
                team_name = "West Ham"
            case team_name where team_name.hasPrefix("Southampton FC"):
            team_name
                = "Southampton"
            default:
                team_name == team_name
            }
            
            return team_name
        }
        home_team.text = home_team_name()
        away_team.text = away_team_name()
    }
    
    
}
