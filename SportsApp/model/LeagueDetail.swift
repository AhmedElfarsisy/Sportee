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
    let strSport, strLeague: String
    let dateFirstEvent,  strCountry : String
    let  strYoutube: String
    let strDescriptionEN: String
    let strBadge:String
	    
    init(idLeague: String, strLeague: String, strSport: String, strBadge: String, strCountry: String, dateFirstEvent :String , strYoutube:String,  strDescriptionEN:String) {
        self.idLeague = idLeague
        self.strLeague = strLeague
        self.strSport = strSport
        self.strBadge = strBadge
        self.strCountry = strCountry
        self.dateFirstEvent = dateFirstEvent
        self.strYoutube = strYoutube
        self.strDescriptionEN = strDescriptionEN
    }
    
}
