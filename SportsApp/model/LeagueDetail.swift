//
//  LeagueDetail.swift
//  SportsApp
//
//  Created by AElfarsisy on 4/17/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation



// MARK: - LeagueDetailResponse
struct LeagueDetailResponse {
    let leagues: [LeagueDetail]
}

// MARK: - League
struct LeagueDetail {
    let idLeague: String
    let idSoccerXML: NSNull
    let idAPIfootball, strSport, strLeague, strLeagueAlternate: String
    let strDivision, idCup, strCurrentSeason, intFormedYear: String
    let dateFirstEvent, strGender, strCountry, strWebsite: String
    let strFacebook, strTwitter, strYoutube: String
    let strRSS: String
    let strDescriptionEN: String
    let strDescriptionDE: NSNull
    let strDescriptionFR: String
    let strDescriptionIT, strDescriptionCN, strDescriptionJP, strDescriptionRU: NSNull
    let strDescriptionES: String
    let strDescriptionPT, strDescriptionSE, strDescriptionNL, strDescriptionHU: NSNull
    let strDescriptionNO, strDescriptionPL, strDescriptionIL: NSNull
    let strFanart1, strFanart2, strFanart3, strFanart4: String
    let strBanner: String
    let strBadge, strLogo: String
    let strPoster: String
    let strTrophy: String
    let strNaming, strComplete, strLocked: String
    
    
}
