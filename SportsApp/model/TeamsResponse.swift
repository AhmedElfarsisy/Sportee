//
//  TeamsResponse.swift
//  SportsApp
//
//  Created by AElfarsisy on 4/17/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation

struct TeamsResponse : Codable {
    let teams : [Teams]?

    enum CodingKeys: String, CodingKey {

        case teams = "teams"
    }

}




struct Teams : Codable {
    let idTeam : String?
    let idSoccerXML : String?
    let idAPIfootball : String?
    let intLoved : String?
    let strTeam : String?
    let strTeamShort : String?
    let strAlternate : String?
    let intFormedYear : String?
    let strSport : String?
    let strLeague : String?
    let idLeague : String?
    let strLeague2 : String?
    let idLeague2 : String?
    let strLeague3 : String?
    let idLeague3 : String?
    let strLeague4 : String?
    let idLeague4 : String?
    let strLeague5 : String?
    let idLeague5 : String?
    let strLeague6 : String?
    let idLeague6 : String?
    let strLeague7 : String?
    let idLeague7 : String?
    let strDivision : String?
    let strManager : String?
    let strStadium : String?
    let strKeywords : String?
    let strRSS : String?
    let strStadiumThumb : String?
    let strStadiumDescription : String?
    let strStadiumLocation : String?
    let intStadiumCapacity : String?
    let strWebsite : String?
    let strFacebook : String?
    let strTwitter : String?
    let strInstagram : String?
    let strDescriptionEN : String?
    let strDescriptionDE : String?
    let strDescriptionFR : String?
    let strDescriptionCN : String?
    let strDescriptionIT : String?
    let strDescriptionJP : String?
    let strDescriptionRU : String?
    let strDescriptionES : String?
    let strDescriptionPT : String?
    let strDescriptionSE : String?
    let strDescriptionNL : String?
    let strDescriptionHU : String?
    let strDescriptionNO : String?
    let strDescriptionIL : String?
    let strDescriptionPL : String?
    let strGender : String?
    let strCountry : String?
    let strTeamBadge : String?
    let strTeamJersey : String?
    let strTeamLogo : String?
    let strTeamFanart1 : String?
    let strTeamFanart2 : String?
    let strTeamFanart3 : String?
    let strTeamFanart4 : String?
    let strTeamBanner : String?
    let strYoutube : String?
    let strLocked : String?

    enum CodingKeys: String, CodingKey {

        case idTeam = "idTeam"
        case idSoccerXML = "idSoccerXML"
        case idAPIfootball = "idAPIfootball"
        case intLoved = "intLoved"
        case strTeam = "strTeam"
        case strTeamShort = "strTeamShort"
        case strAlternate = "strAlternate"
        case intFormedYear = "intFormedYear"
        case strSport = "strSport"
        case strLeague = "strLeague"
        case idLeague = "idLeague"
        case strLeague2 = "strLeague2"
        case idLeague2 = "idLeague2"
        case strLeague3 = "strLeague3"
        case idLeague3 = "idLeague3"
        case strLeague4 = "strLeague4"
        case idLeague4 = "idLeague4"
        case strLeague5 = "strLeague5"
        case idLeague5 = "idLeague5"
        case strLeague6 = "strLeague6"
        case idLeague6 = "idLeague6"
        case strLeague7 = "strLeague7"
        case idLeague7 = "idLeague7"
        case strDivision = "strDivision"
        case strManager = "strManager"
        case strStadium = "strStadium"
        case strKeywords = "strKeywords"
        case strRSS = "strRSS"
        case strStadiumThumb = "strStadiumThumb"
        case strStadiumDescription = "strStadiumDescription"
        case strStadiumLocation = "strStadiumLocation"
        case intStadiumCapacity = "intStadiumCapacity"
        case strWebsite = "strWebsite"
        case strFacebook = "strFacebook"
        case strTwitter = "strTwitter"
        case strInstagram = "strInstagram"
        case strDescriptionEN = "strDescriptionEN"
        case strDescriptionDE = "strDescriptionDE"
        case strDescriptionFR = "strDescriptionFR"
        case strDescriptionCN = "strDescriptionCN"
        case strDescriptionIT = "strDescriptionIT"
        case strDescriptionJP = "strDescriptionJP"
        case strDescriptionRU = "strDescriptionRU"
        case strDescriptionES = "strDescriptionES"
        case strDescriptionPT = "strDescriptionPT"
        case strDescriptionSE = "strDescriptionSE"
        case strDescriptionNL = "strDescriptionNL"
        case strDescriptionHU = "strDescriptionHU"
        case strDescriptionNO = "strDescriptionNO"
        case strDescriptionIL = "strDescriptionIL"
        case strDescriptionPL = "strDescriptionPL"
        case strGender = "strGender"
        case strCountry = "strCountry"
        case strTeamBadge = "strTeamBadge"
        case strTeamJersey = "strTeamJersey"
        case strTeamLogo = "strTeamLogo"
        case strTeamFanart1 = "strTeamFanart1"
        case strTeamFanart2 = "strTeamFanart2"
        case strTeamFanart3 = "strTeamFanart3"
        case strTeamFanart4 = "strTeamFanart4"
        case strTeamBanner = "strTeamBanner"
        case strYoutube = "strYoutube"
        case strLocked = "strLocked"
    }
}
