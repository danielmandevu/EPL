//
//  fixtureViewController.swift
//  EPL
//
//  Created by daniel on 3/10/21.
//  Copyright © 2021 daniel. All rights reserved.
//

import UIKit 

class fixtureViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{

    @IBOutlet weak var searching: UISearchBar!
    @IBOutlet weak var SegmentedControl: UISegmentedControl!
    @IBOutlet weak var fixtureTable: UITableView!
    let actIndicator = UIActivityIndicatorView()
    var games = [fixture_data]() //for all games
    var searchGame = [fixture_data]() //for the specific game searched
    var searched = false
    lazy var games_filter = self.searchGame
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searching.delegate = self
        fixtureTable.delegate = self
        fixtureTable.dataSource = self
        fixtureTable.register(fixtureTableViewCell.nib(), forCellReuseIdentifier: fixtureTableViewCell.fix_id)
        match_fixture()
        // Do any additional setup after loading the view.
    }
    
//HELLO WORLD
    func match_fixture(){
        let key = "dcbd1e10-4ad8-11eb-a6ab-498417043a56"
        //let url = "https://app.sportdataapi.com/api/v1/soccer/matches?apikey=\(key)&season_id=352&date_from=2021-04-23"
        //let url = "http://localhost/projects/ios/soccerscore/trueLinks/matches.py"
        let url = "http://localhost/projects/ios/soccerscore/match.py"
        URLSession.shared.dataTask(with: URL(string: url)!,completionHandler: {
            data,response,error in
            guard let data = data, error == nil else{return}
            let result:match_fix?
            do{
                result = try? JSONDecoder().decode(match_fix.self, from: data)
                if result == nil {return} else{
                    self.games = result?.data.filter({$0.status != "Finished"}) as! [fixture_data]
                    self.games.sort(by: {$0.match_start < $1.match_start})
                }
            }
            
            DispatchQueue.main.async {
                self.filter_data()
             
            }
            
        }
        
        ).resume()
    }
    override func viewDidAppear(_ animated: Bool) {
//        let loader = self.loader()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
//            self.stopLoader(loader: loader)
//        }
    }
    func loader()->UIAlertController{
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        //actIndicator.frame = CGRect(x: 0, y: 0, width: view., height: 40)
        actIndicator.startAnimating()
        actIndicator.color = .red
        actIndicator.center = self.view.center
        //actIndicator.style = .large
        actIndicator.hidesWhenStopped = true
        self.parent?.present(alert, animated: true, completion: nil)
        alert.view.addSubview(actIndicator)
        return alert
    }
    func stopLoader(loader: UIAlertController){
        DispatchQueue.main.async {
            loader.dismiss(animated: true, completion: nil)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  searched{
            if searchGame.count == 0 && games_filter.count != 0{
                
                self.fixtureTable.Empty_data("     NO match      ")
            }
           
            return searchGame.count
        }
        else{
            if games_filter.count == 0 && searchGame.count == 0 {
                if SegmentedControl.selectedSegmentIndex == 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01){
                        if self.games_filter.count == 0{
                                                   self.fixtureTable.Empty_data("\n No games today   \n")}
                                               else{return}
                    }
                }
                else if SegmentedControl.selectedSegmentIndex == 2{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.02){
                        if self.games_filter.count == 0{
                                                   self.fixtureTable.Empty_data("              \n Sorry, there are no matches tomorrow    \n      ")}
                                               else{return}
                    }
                }
                else{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                        if self.games_filter.count == 0{
                            self.fixtureTable.Empty_data(" \nEPL hasn`t started yet\n Pleas wait a little longer \n")}
                        else{return}
                    }
                   }
            }
            else{self.fixtureTable.restore()}
            return games_filter.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fixtureTable.dequeueReusableCell(withIdentifier: fixtureTableViewCell.fix_id, for: indexPath) as! fixtureTableViewCell
        if searched{
            cell.configure(with: searchGame[indexPath.row])
        }
        else{
            cell.configure(with: games_filter[indexPath.row])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "show_fix_detail", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? fixture_detailViewController{
            if searched{
                destination.fixtureinfo = searchGame[(fixtureTable.indexPathForSelectedRow?.row)!]
                fixtureTable.deselectRow(at: fixtureTable.indexPathForSelectedRow!, animated: true)
            }
            else{
                destination.fixtureinfo = games_filter[(fixtureTable.indexPathForSelectedRow?.row)!]
                fixtureTable.deselectRow(at: fixtureTable.indexPathForSelectedRow!, animated: true)
                
            }
            
        }
    }
    func today()->String{
        let lelo = Date()
        let form = DateFormatter()
        form.dateFormat = "y/MM/dd"
        let final = form.string(from: lelo)
        //let dt = form.date(from: final)
        return final
    }
    
    func filter_data(){
    //    18/05/2021 job //but done on 06-06-2021
        func todays_date()->String{
            let dt = Date()
            let form = DateFormatter()
            form.dateFormat = "y-MM-dd"
            let str = form.string(from: dt)
            return str
        }
        func tomorrows_date()->String{
            let today = Date()
            let form = DateFormatter()
            form.dateFormat = "y-MM-dd"
            let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today)
            let mawa = form.string(from: tomorrow!)
            return mawa
        }
        
        let All = self.games//.filter{$0.match_start == "2021-05-08 23:00:00"}
        let today = self.games.filter{$0.match_start.hasPrefix("\(todays_date())")}
        let tomorrow = self.games.filter{$0.match_start.hasPrefix("\(tomorrows_date())")}
        switch SegmentedControl.selectedSegmentIndex {
        case 0:
            self.games_filter = All
        case 1:
            self.games_filter = today
        case 2:
            if tomorrow.count != 0 {
                self.games_filter = tomorrow
            }
            else{
                self.games_filter = tomorrow
                // if no match available show a N/A notification.
                
            }
            default:
            print("#danielAbrahamMandevu#")
        }
        
        fixtureTable.reloadData()
        
    }
    @IBAction func match_timeSegments(_ sender: UISegmentedControl) {
      filter_data()

      }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == ""{
            searched = false
            self.fixtureTable.reloadData()
        }
        else{
            searched = true
            searchGame = games_filter.filter({$0.home_team.name.lowercased().prefix(searchText.count) == searchText.lowercased() || $0.away_team.name.lowercased().prefix(searchText.count) == searchText.lowercased() })
            

            self.fixtureTable.reloadData()
        }

    }
}
extension UITableView{
    func Empty_data(_ message:String){
        //let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.bounds.size.width, height: self.bounds.size.height))
        let messageLabel = UILabel()
        addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 5
        //messageLabel.sizeToFit()
        messageLabel.layer.cornerRadius = 7
        messageLabel.layer.borderColor = UIColor.gray.cgColor
        messageLabel.layer.borderWidth = 0.7
        //messageLabel.font = UIFont(name: "Poppins", size: 18)
        messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 80).isActive = true
        
        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }
    func restore(){
        self.backgroundView = nil
    }
}
