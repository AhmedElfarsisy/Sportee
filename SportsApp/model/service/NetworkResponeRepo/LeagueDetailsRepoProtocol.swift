//
//  LeagueDetailsRepoProtocol.swift
//  SportsApp
//
//  Created by Hanan on 4/20/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation

protocol LeagueDetailsRepoProtocol {
    
    func getUpcomingEvents(id:String , completionHandler :@escaping([Events]?) -> Void , onFailure : @escaping (String)-> Void)
    func getLatestResults(id: String ,completionHandler :@escaping([Events]?) -> Void , onFailure : @escaping (String)-> Void)
    func getTeams(id:String ,completionHandler :@escaping([Teams]?) -> Void , onFailure : @escaping (String)-> Void)
}
