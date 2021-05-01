//
//  LeagueDetailPresenterProtocol.swift
//  SportsApp
//
//  Created by AElfarsisy on 4/17/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation

protocol LeagueDetailPresenterProtocol {
    func featchUpcomingEvents(id : String )
    func featchLastResult(id : String )
    func featchTeams(id : String )
    func addLeague(league:League)
    func deletLeague(league:League)  
    func attachView (view : LeagueDetailsViewController)
    
    func updateLeagueDetailsView(reloader : ()-> Void)
    var view: LeagueDetailsViewController? {get
        set
    }
    var leagueDetailsRepo :LeagueDetailsRepoProtocol? {get
        set
    }
}
