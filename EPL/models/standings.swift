//
//  standings.swift
//  EPL
//
//  Created by daniel on 2/28/21.
//  Copyright © 2021 daniel. All rights reserved.
//

import Foundation
struct Root:Codable {
    let data:Datum
}
struct Datum:Codable{
    let standings:[Standings]
}
struct Standings:Codable {
    let points,position,team_id:Int
    let status:String
    let result:String?
    let overall:Overall
    let home:Overall
    let away:Overall
}
struct Overall:Codable {
    let games_played,won,draw,lost,goals_diff,goals_scored,goals_against:Int
}
