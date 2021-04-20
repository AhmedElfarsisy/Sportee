//
//  AppDependancy.swift
//  SportsApp
//
//  Created by Hanan on 4/20/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation

class AppDependancy{
    
    var router = RouterD()
    
    init() {
        creatDependecies()
    }
    
    func creatDependecies(){
        
        let apiRequest = APIRequest.instance
        
        let remoteDataSource = RemoteDataSource( apiRequest: apiRequest)
        
        let sportsRepo = SportsRepo(remoteDataSource: remoteDataSource)
        
        let leagueRepo = LeaguesRepo(remoteDataSource: remoteDataSource)
        
        let leagueDetailsRepo = LeagueDetailsRepo(remoteDataSource: remoteDataSource)
        
        router.sportsRepo = sportsRepo
        router.leagueRepo = leagueRepo
        router.leagueDetailsRepo = leagueDetailsRepo
        
        
    }
    
}
