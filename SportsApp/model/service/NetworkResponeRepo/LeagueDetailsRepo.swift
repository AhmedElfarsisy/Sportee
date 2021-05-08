//
//  LeagueDetailsRepo.swift
//  SportsApp
//
//  Created by Hanan on 4/20/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation
class LeagueDetailsRepo : LeagueDetailsRepoProtocol{
    
    let remoteDataSource :RemoteDataSourceProtocol
      
      init(remoteDataSource :RemoteDataSourceProtocol) {
          self.remoteDataSource = remoteDataSource
      }
      
    
    func getUpcomingEvents(id: String, completionHandler: @escaping ([Events]?) -> Void, onFailure: @escaping (String) -> Void) {
        remoteDataSource.getUpcomingEvents(id: id, completionHandler: completionHandler, onFailure: onFailure)
    }
    
    func getLatestResults(id: String, completionHandler: @escaping ([Events]?) -> Void, onFailure: @escaping (String) -> Void) {
         remoteDataSource.getLatestResults(id: id, completionHandler: completionHandler, onFailure: onFailure)
    }
    
    func getTeams(id: String, completionHandler: @escaping ([Teams]?) -> Void, onFailure: @escaping (String) -> Void) {
         remoteDataSource.getTeams(id: id, completionHandler: completionHandler, onFailure: onFailure)
    }
    
    
    
}
