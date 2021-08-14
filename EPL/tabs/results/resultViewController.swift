//
//  resultViewController.swift
//  EPL
//
//  Created by daniel on 3/10/21.
//  Copyright © 2021 daniel. All rights reserved.
//

import UIKit

class resultViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var match_resultTable: UITableView!
    
    var result_match = [fixture_data]()
    var those_finished = [fixture_data]()
    var finishedd = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.selectedIndex = 1
        match_resultTable.delegate = self
        match_resultTable.dataSource = self
        match_resultTable.register(match_resultTableViewCell.nib(), forCellReuseIdentifier: match_resultTableViewCell.identifier)
        match_results()
        // Do any additional setup after loading the view.
    }
    
    func match_results(){
        let key = "dcbd1e10-4ad8-11eb-a6ab-498417043a56"
        //let url = "https://app.sportdataapi.com/api/v1/soccer/matches?apikey=\(key)&season_id=352&date_from=2021-04-15"
        let url = "http://localhost/projects/ios/soccerscore/trueLinks/matches.py"
        self.finishedd = true
        URLSession.shared.dataTask(with: URL(string: url)!,completionHandler: {
            data,response,error in
            guard let data = data, error == nil else{return}
            var result:match_fix?
            do{
                result = try! JSONDecoder().decode(match_fix.self, from: data)
                self.those_finished = result?.data.filter({$0.status == "finished"}) as! [fixture_data]
                self.result_match.append(contentsOf: self.those_finished)
            }
            
            DispatchQueue.main.async {
                self.match_resultTable.reloadData()
            }
            }).resume()

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result_match.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = match_resultTable.dequeueReusableCell(withIdentifier: match_resultTableViewCell.identifier, for: indexPath) as! match_resultTableViewCell
        if finishedd{
            cell.configure(with: those_finished[indexPath.row])
        }
        else{
            cell.configure(with: result_match[indexPath.row])
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        match_resultTable.deselectRow(at: match_resultTable.indexPathForSelectedRow!, animated: true)
    }
    
}
