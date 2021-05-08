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
//    let idSoccerXML: NSNull
    let idAPIfootball, strSport, strLeague, strLeagueAlternate: String
    let strDivision, idCup, strCurrentSeason, intFormedYear: String
//    let dateFirstEvent, strGender, strCountry, strWebsite: String
//    strFacebook, strTwitter,
    let strYoutube: String
    let strRSS: String
    let strDescriptionEN: String
//    let strBanner: String
    let strBadge, strLogo: String
//    let strPoster: String
//    let strTrophy: String
//    let strNaming, strComplete, strLocked: String
    
    
}
