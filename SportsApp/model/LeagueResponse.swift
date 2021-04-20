//
//  LeagueResponse.swift
//  SportsApp
//
//  Created by AElfarsisy on 4/17/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation


// MARK: - Welcome
struct LeagueResponse {
    let leagues: [League]
}

// MARK: - League
struct League {
    
    let idLeague: String
    let strLeague : String
    let strBadge :String
    let strYoutube: String
    
    let strDivision: String
    
//    let idLeague, strLeague: String
//    let strSport: StrSport
//    let strLeagueAlternate: String?
}

enum StrSport {
    case americanFootball
    case australianFootball
    case baseball
    case basketball
    case cricket
    case cycling
    case darts
    case eSports
    case esports
    case fieldHockey
    case fighting
    case golf
    case handball
    case iceHockey
    case motorsport
    case motorsports
    case netball
    case rugby
    case snooker
    case soccer
    case tennis
    case volleyball
}
