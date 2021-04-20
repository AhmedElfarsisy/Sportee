//
//  APIRequest.swift
//  SportsApp
//
//  Created by Hanan on 4/20/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation
import Alamofire
import  SwiftyJSON


class APIRequest :APIRequestProtocol  {
    
    static let instance = APIRequest()
     
     private init (){}
    
    func getSports( completionHandler :@escaping([Sport]?) -> Void , onFailure : @escaping (String)-> Void)  {
        var sportsList = [Sport]()
        Alamofire.request(Constants.SPORTS_URL).response{ response in
            
            if let data = response.data {
                let json = JSON(data)
                let sports = json[Constants.SPORTS].arrayValue
                print("sports start")
                for sport in sports {
                    
                    let id = sport[Constants.idSport].intValue
                    let name = sport[Constants.strSport].stringValue
                    let thumbnail = sport[Constants.strSportThumb].stringValue
                    let format = sport[Constants.strFormat].stringValue
                    let desc = sport[Constants.strSportDescription].stringValue
                    let thumbnailGreen = sport[Constants.strSportThumbGreen].stringValue
                    let spotrObj = Sport(idSpor: id, strSport: name, strFormat: format, strSportThumb: thumbnail, strSportThumbGreen: thumbnailGreen, strSportDescription: desc)
                    sportsList.append(spotrObj)
                    print(name)
                    
                }
                completionHandler(sportsList)
                
                print("sports end")
            }
            else {
                onFailure (response.error?.localizedDescription ?? "Can't get Sports data")
            }
            
        }
        
    }
    
    func getLeagues(sportName: String , completionHandler :@escaping([League]?) -> Void , onFailure : @escaping (String)-> Void) {
        var leaguesList = [League]()
        Alamofire.request(Constants.LEAGUES_URL+sportName).response { response in
            
            if let statusCode = response.response?.statusCode{
                
                if statusCode == 200 {
                    if let data = response.data {
                        let json = JSON(data)
                        let leagues = json[Constants.COUNTRYS].arrayValue
                        print("Leagues start")
                        for league in leagues {
                            let id = league[Constants.idLeague].stringValue
                            let name = league[Constants.strLeague].stringValue
                            let badge = league[Constants.strBadge].stringValue
                            let devision = league[Constants.strDivision].stringValue
                            let youtube = league[Constants.strYoutube].stringValue
                            
                            let leg = League(idLeague: id, strLeague: name, strBadge: badge, strYoutube: youtube, strDivision: devision)
                            leaguesList.append(leg)
                            print(name)
                            
                        }
                        completionHandler(leaguesList)
                        
                        print("sports end")
                    }
                    else {
                        onFailure (response.error?.localizedDescription ?? "Can't get Leagues data")
                    }
                }
            }
            
            
        }
        
    }
    
    func getUpcomingEvents(id: String , completionHandler :@escaping([Events]?) -> Void , onFailure : @escaping (String)-> Void) {
        
        let url = Constants.UPCOMING_EVENTS_URL+id+Constants.UPCOMING_EVENTS_URI
        print(url)
        print("https://www.thesportsdb.com/api/v1/json/1/eventsround.php?id=4328&r=10&s=2020-2021")
        var eventssArray = [Events]()
        Alamofire.request(url).response { response in
            
            if let data = response.data {
                
                let json = JSON(data)
                //  print("JSON: \(json)")
                let events = json[Constants.EVENTS].arrayValue
                
                for event in events {
                    let id = event[Constants.idEvent].stringValue
                    
                    let name = event[Constants.strEvent].stringValue
                    let date = event[Constants.strDateEvent].stringValue
                    let time = event[Constants.strTimeEvent].stringValue
                    var eventObj = Events(idEvent: id, strEvent: name, dateEvent: date, strTime: time)
                    //eventObj.str
                    eventssArray.append(eventObj)
                    
                    //let name = sport["strSport"]
                    print("name event "+date)
                }
                completionHandler(eventssArray)
                
            }
            else{
                onFailure (response.error?.localizedDescription ?? "Can't get Events data")
            }
        }
        
    }
    
    func getLatestResults(id: String ,completionHandler :@escaping([Events]?) -> Void , onFailure : @escaping (String)-> Void) {
        
        var latestResultsList = [Events]()
        Alamofire.request(Constants.LATESTRESULT_URL+id).response { response in
            
            if let data = response.data {
                
                let json = JSON(data)
                //  print("JSON: \(json)")
                let latestResults = json[Constants.EVENTS].arrayValue
                
                for result in latestResults {
                    let id = result[Constants.idEvent].stringValue
                    
                    let name = result[Constants.strEvent].stringValue
                    let date = result[Constants.strDateEvent].stringValue
                    let time = result[Constants.strTimeEvent].stringValue
                    
                    //                         let intHomeScore = result[Constants.strTimeEvent].int
                    //                         let intAwayScore = result[Constants.strTimeEvent].stringValue
                    var eventObj = Events(idEvent: id, strEvent: name, dateEvent: date, strTime: time)
                    //eventObj.str
                    latestResultsList.append(eventObj)
                    
                    
                    print("latest events"+date)
                }
                completionHandler(latestResultsList)
                
            }
            else{
                onFailure (response.error?.localizedDescription ?? "Can't get Events data")
            }
            
            
            
        }
        
        
    }
    
    func getTeams(id: String ,completionHandler :@escaping([Teams]?) -> Void , onFailure : @escaping (String)-> Void) {
        let url = "https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id="+id
        var teamsList = [Teams]()
        Alamofire.request(url).response { response in
            
            if let data = response.data {
                
                let json = JSON(data)
                //  print("JSON: \(json)")
                let teams = json[Constants.TEAMS].arrayValue
                
                for team in teams {
                    let id = team[Constants.idTeam].stringValue
                    let name = team[Constants.strTeam].stringValue
                    let stadium = team[Constants.strStadium].stringValue
                    let stadiumLocation = team[Constants.strStadiumLocation].stringValue
                    let badge = team[Constants.strTeamBadge].stringValue
                    var tem = Teams(idTeam: id, strTeam:name, strStadium: stadium, strStadiumLocation: stadiumLocation, strTeamBadge: badge)
                    teamsList.append(tem)
                    
                    print("teams "+name)
                }
                completionHandler(teamsList)
            }
            else
            {
                onFailure(response.error?.localizedDescription ?? "Can't get Teams data")
            }
            
            
        }
        
    }
    
    
    
    
    
}
