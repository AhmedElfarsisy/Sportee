//
//  LeaguePresenter.swift
//  SportsApp
//
//  Created by AElfarsisy on 4/17/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation
class LeaguePresenter :  LeaguePresenterProtocol {
    var view : LeaguesViewController?
    
    var leagueRepo :LeagueRepoProtocol?
    
    let favoritLeague = FavoriteLeagueDao.shared
    
    func featchLeagues(name :String) {
        print("featchLeagues")
        leagueRepo?.getLeagues(sportName: name, completionHandler: { (leagues) in
            self.view?.leaguesList = leagues
            var myLea : [League]?
            myLea = leagues
        }, onFailure: { (error) in
            self.view?.error = error
            
        })
    
    }
    
    func attachView(view: LeaguesViewController) {
        self.view = view
    }
  
    func updateView(reloader : ()-> Void)  {
           reloader()
       }
    
     func addLeague(league: League) {
        
        favoritLeague.saveLeague(league: league)
     }
    
}
