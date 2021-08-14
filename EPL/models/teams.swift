//
//  teams.swift
//  EPL
//
//  Created by daniel on 3/6/21.
//  Copyright © 2021 daniel. All rights reserved.
//

import Foundation

struct Team_root:Codable {
    let data:[teams]
}
struct teams:Codable {
    let team_id:Int
    let name:String
   // let name,short_code:String
    //let comm_name:String?
    //let logo:String
}
