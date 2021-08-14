//
//  match.swift
//  EPL
//
//  Created by daniel on 3/6/21.
//  Copyright © 2021 daniel. All rights reserved.
//

import Foundation

struct match_fix:Codable {
    let data:[fixture_data]
}

struct fixture_data:Codable {
    let match_id,status_code:Int
    let status:String
    let match_start: String
    let league_id:Int
    let season_id: Int
    let round: Round
    let minute:Int?
    let match_start_iso:String
    let stage:Stage
    let home_team:Team
    let away_team:Team
    let stats:Stats?
    let venue:Venue?
    let group:Group?
    let referee_id:Int?
}
struct Venue:Codable {
        let venue_id:Int
        let name:String?
        let city:String
        let capacity:Int
        let country_id:Int
    }

struct Round:Codable {
        let round_id:Int
        let name:String
        let is_current:Int?
}
struct Group:Codable {
    let group_id:Int
    let group_name:String
}
struct Stage:Codable {
    let stage_id:Int
    let name:String
}
struct Team:Codable {
    let team_id:Int
    let name,short_code,common_name:String
    let logo:String?
    let country:Country?
}

struct Country:Codable {
    let country_id:Int
    let name,country_code,continent:String
}

struct Stats:Codable {
    let home_score,away_score:Int
    let ft_score:String?
    let et_score,ps_score:Int?
}


