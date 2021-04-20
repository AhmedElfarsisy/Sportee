//
//  RemoteDataSourceProtocol.swift
//  SportsApp
//
//  Created by AElfarsisy on 4/17/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation

protocol RemoteDataSourceProtocol {
    func getSports(completionHandler :@escaping ([Sport]?) -> Void , onFailure : @escaping (String)-> Void)
    func getLeagues(sportName: String , completionHandler :@escaping([League]?) -> Void , onFailure : @escaping (String)-> Void)
    
    func getUpcomingEvents(id:String , completionHandler :@escaping([Events]?) -> Void , onFailure : @escaping (String)-> Void)
    func getLatestResults(id: String ,completionHandler :@escaping([Events]?) -> Void , onFailure : @escaping (String)-> Void)
    func getTeams(id:String ,completionHandler :@escaping([Teams]?) -> Void , onFailure : @escaping (String)-> Void)
}
