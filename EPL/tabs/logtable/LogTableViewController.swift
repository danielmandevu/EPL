//
//  ViewController.swift
//  EPL
//
//  Created by daniel on 2/28/21.
//  Copyright © 2021 daniel. All rights reserved.
//

import UIKit

class LogTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var logtableview: UITableView!
    var total_teams = [Standings]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logtableview.delegate = self
        logtableview.dataSource = self
        logtableview.register(logTableViewCell.nib(), forCellReuseIdentifier: logTableViewCell.identifier)
        standings()
        
        // Do any additional setup after loading the view.
    }
    
    func standings(){
        let key = "dcbd1e10-4ad8-11eb-a6ab-498417043a56"
        //let url = "https://app.sportdataapi.com/api/v1/soccer/standings?apikey=\(key)&season_id=352"
        let url = "http://localhost/projects/ios/soccerscore/trueLinks/stands.py"
        URLSession.shared.dataTask(with: URL(string: url)!,completionHandler:
            {
                data, response, error in
                guard let data = data, error == nil else{return}
                var result:Root?
                do{
                    result = try? JSONDecoder().decode(Root.self, from: data) 
                   
                }
                guard let finalResult = result else{return}
                                   let newTable = finalResult.data.standings
                                   self.total_teams.append(contentsOf: newTable)
                DispatchQueue.main.async {
                    self.logtableview.reloadData()
                }
        }
        ).resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return total_teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = logtableview.dequeueReusableCell(withIdentifier: logTableViewCell.identifier, for: indexPath) as! logTableViewCell
        cell.configure(with: total_teams[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         logtableview.deselectRow(at: logtableview.indexPathForSelectedRow!, animated: true)
    }
}

