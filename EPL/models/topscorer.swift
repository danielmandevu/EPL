//
//  topscorer.swift
//  EPL
//
//  Created by daniel on 4/13/21.
//  Copyright © 2021 daniel. All rights reserved.
//

import Foundation

struct topscores:Codable {
    let data:[topscorer]
}

struct topscorer:Codable{
    let pos:Int
    let player:player_details
    let team:player_team
    let matches_played:Int
    let minutes_played:Int
    let substituted_in:Int?
    let goals:goals_detail
    let penalties:Int?
}
struct player_details:Codable {
    let player_name:String?
}
struct player_team:Codable {
    let team_name:String?
    let team_id:Int?
}
struct goals_detail:Codable {
    let overall,away,home:Int?
}
