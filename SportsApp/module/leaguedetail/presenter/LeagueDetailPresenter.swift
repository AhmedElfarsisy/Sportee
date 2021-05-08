//
//  LeagueDetailPresenter.swift
//  SportsApp
//
//  Created by AElfarsisy on 4/17/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation

class LeagueDetailPresenter  : LeagueDetailPresenterProtocol {
    
    var view: LeagueDetailsViewController?
    var leagueDetailsRepo :LeagueDetailsRepoProtocol?
    let favoritLeague = FavoriteLeagueDao.shared
    
    func featchUpcomingEvents(id : String ) {
        
        self.leagueDetailsRepo?.getUpcomingEvents(id: id, completionHandler: { (upcomingEvents) in
            self.view?.upComingEvents = upcomingEvents
            //  print(upcomingEvents![1].dateEvent)
            
        }, onFailure: { (error) in
            self.view?.error = error.localizedLowercase
        })
        
    }
    
    func featchLastResult(id : String ) {
        
        self.leagueDetailsRepo?.getLatestResults(id: id, completionHandler: { (lastEvents) in
            self.view?.lastResultsList = lastEvents
            
        }, onFailure: { (error) in
            self.view?.error = error.localizedLowercase
        })
        
    }
    
    func featchTeams(id : String ) {
        
        self.leagueDetailsRepo?.getTeams(id: id, completionHandler: { (teams) in
            self.view?.teamsList = teams
            
        }, onFailure: { (error) in
            self.view?.error = error.localizedLowercase
        })
        
    }
    
    func attachView(view: LeagueDetailsViewController) {
        self.view = view
    }
    
    func updateLeagueDetailsView(reloader : ()-> Void)  {
        reloader()
    }
    
    func addLeague(league: League) {
        if !favoritLeague.isFovorite(leagueId: league.idLeague) {
            favoritLeague.saveLeague(league: league)
            
        }
        else {
            
            Helper().showAlert(message: "This League Already exist",view: view!)
        }
    }
    func deletLeague(league: League) {
        favoritLeague.removeLeague(league: league)
    }
    
    
    
}
