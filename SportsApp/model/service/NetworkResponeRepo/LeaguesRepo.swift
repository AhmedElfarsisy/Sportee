//
//  LeaguesRepo.swift
//  SportsApp
//
//  Created by Hanan on 4/20/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation

class LeaguesRepo: LeagueRepoProtocol  {
    let remoteDataSource :RemoteDataSourceProtocol
    
    init(remoteDataSource :RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    
    func getLeagues(sportName: String, completionHandler: @escaping ([League]?) -> Void, onFailure: @escaping (String) -> Void) {
        remoteDataSource.getLeagues(sportName: sportName, completionHandler: completionHandler, onFailure: onFailure)
        
    }
    
    
}
