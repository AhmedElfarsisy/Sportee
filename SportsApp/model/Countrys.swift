
import Foundation
struct Countrys : Codable {
	let idLeague : String?
	let idSoccerXML : String?
	let idAPIfootball : String?
	let strSport : String?
	let strLeague : String?
	let strLeagueAlternate : String?
	let strDivision : String?
	let idCup : String?
	let strCurrentSeason : String?
	let intFormedYear : String?
	let dateFirstEvent : String?
	let strGender : String?
	let strCountry : String?
	let strWebsite : String?
	let strFacebook : String?
	let strTwitter : String?
	let strYoutube : String?
	let strRSS : String?
	let strDescriptionEN : String?
	let strFanart1 : String?
	let strFanart2 : String?
	let strFanart3 : String?
	let strFanart4 : String?
	let strBanner : String?
	let strBadge : String?
	let strLogo : String?
	let strPoster : String?
	let strTrophy : String?
	let strNaming : String?
	let strComplete : String?
	let strLocked : String?

	enum CodingKeys: String, CodingKey {

		case idLeague = "idLeague"
		case idSoccerXML = "idSoccerXML"
		case idAPIfootball = "idAPIfootball"
		case strSport = "strSport"
		case strLeague = "strLeague"
		case strLeagueAlternate = "strLeagueAlternate"
		case strDivision = "strDivision"
		case idCup = "idCup"
		case strCurrentSeason = "strCurrentSeason"
		case intFormedYear = "intFormedYear"
		case dateFirstEvent = "dateFirstEvent"
		case strGender = "strGender"
		case strCountry = "strCountry"
		case strWebsite = "strWebsite"
		case strFacebook = "strFacebook"
		case strTwitter = "strTwitter"
		case strYoutube = "strYoutube"
		case strRSS = "strRSS"
		case strDescriptionEN = "strDescriptionEN"
	
		case strFanart1 = "strFanart1"
		case strFanart2 = "strFanart2"
		case strFanart3 = "strFanart3"
		case strFanart4 = "strFanart4"
		case strBanner = "strBanner"
		case strBadge = "strBadge"
		case strLogo = "strLogo"
		case strPoster = "strPoster"
		case strTrophy = "strTrophy"
		case strNaming = "strNaming"
		case strComplete = "strComplete"
		case strLocked = "strLocked"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		idLeague = try values.decodeIfPresent(String.self, forKey: .idLeague)
		idSoccerXML = try values.decodeIfPresent(String.self, forKey: .idSoccerXML)
		idAPIfootball = try values.decodeIfPresent(String.self, forKey: .idAPIfootball)
		strSport = try values.decodeIfPresent(String.self, forKey: .strSport)
		strLeague = try values.decodeIfPresent(String.self, forKey: .strLeague)
		strLeagueAlternate = try values.decodeIfPresent(String.self, forKey: .strLeagueAlternate)
		strDivision = try values.decodeIfPresent(String.self, forKey: .strDivision)
		idCup = try values.decodeIfPresent(String.self, forKey: .idCup)
		strCurrentSeason = try values.decodeIfPresent(String.self, forKey: .strCurrentSeason)
		intFormedYear = try values.decodeIfPresent(String.self, forKey: .intFormedYear)
		dateFirstEvent = try values.decodeIfPresent(String.self, forKey: .dateFirstEvent)
		strGender = try values.decodeIfPresent(String.self, forKey: .strGender)
		strCountry = try values.decodeIfPresent(String.self, forKey: .strCountry)
		strWebsite = try values.decodeIfPresent(String.self, forKey: .strWebsite)
		strFacebook = try values.decodeIfPresent(String.self, forKey: .strFacebook)
		strTwitter = try values.decodeIfPresent(String.self, forKey: .strTwitter)
		strYoutube = try values.decodeIfPresent(String.self, forKey: .strYoutube)
		strRSS = try values.decodeIfPresent(String.self, forKey: .strRSS)
		strDescriptionEN = try values.decodeIfPresent(String.self, forKey: .strDescriptionEN)

		strFanart1 = try values.decodeIfPresent(String.self, forKey: .strFanart1)
		strFanart2 = try values.decodeIfPresent(String.self, forKey: .strFanart2)
		strFanart3 = try values.decodeIfPresent(String.self, forKey: .strFanart3)
		strFanart4 = try values.decodeIfPresent(String.self, forKey: .strFanart4)
		strBanner = try values.decodeIfPresent(String.self, forKey: .strBanner)
		strBadge = try values.decodeIfPresent(String.self, forKey: .strBadge)
		strLogo = try values.decodeIfPresent(String.self, forKey: .strLogo)
		strPoster = try values.decodeIfPresent(String.self, forKey: .strPoster)
		strTrophy = try values.decodeIfPresent(String.self, forKey: .strTrophy)
		strNaming = try values.decodeIfPresent(String.self, forKey: .strNaming)
		strComplete = try values.decodeIfPresent(String.self, forKey: .strComplete)
		strLocked = try values.decodeIfPresent(String.self, forKey: .strLocked)
	}

}
