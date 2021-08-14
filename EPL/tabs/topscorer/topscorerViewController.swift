//
//  topscorerViewController.swift
//  EPL
//
//  Created by daniel on 4/13/21.
//  Copyright © 2021 daniel. All rights reserved.
//

import UIKit

class topscorerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var topscorerstable: UITableView!
    var top_scorers = [topscorer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topscorerstable.delegate = self
        topscorerstable.dataSource = self
        topscorerstable.register(topsTableViewCell.nib(), forCellReuseIdentifier: topsTableViewCell.tops_id)
        top()
        // Do any additional setup after loading the view.
    }

    func top(){
        let key = "dcbd1e10-4ad8-11eb-a6ab-498417043a56"
        //let url = "https://app.sportdataapi.com/api/v1/soccer/topscorers?apikey=\(key)&season_id=352"
        let url = "http://localhost/projects/ios/soccerscore/topscorer.py"
        URLSession.shared.dataTask(with: URL(string: url)!,completionHandler:{
            data,response,error in
            guard let data = data, error == nil else{return}
            var result:topscores?
            do{
                result = try? JSONDecoder().decode(topscores.self, from: data)
                
            }
            let result_finale = result?.data
            self.top_scorers.append(contentsOf: result_finale!)
        
            DispatchQueue.main.async {
                self.topscorerstable.reloadData()
                       }
            }).resume()
        
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        top_scorers.count 
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = topscorerstable.dequeueReusableCell(withIdentifier: topsTableViewCell.tops_id, for: indexPath) as! topsTableViewCell
        cell.configure(with: top_scorers[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let tb_list = self.top_scorers[indexPath.row]
        
        performSegue(withIdentifier: "tops_detail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? scorerViewController{
            destination.detail = top_scorers[(topscorerstable.indexPathForSelectedRow?.row)!]
            topscorerstable.deselectRow(at: topscorerstable.indexPathForSelectedRow!, animated: true)
        }
    }

    
        }
