//
//  FavoritePresenter.swift
//  SportsApp
//
//  Created by AElfarsisy on 4/17/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation

class FavoritePresenter: FavoritePresenterProtocol {
    var view :FavoritsViewController?
    let favoritLeague = FavoriteLeagueDao.shared
    func featchfavorits() -> [League] {
         return  favoritLeague.fetchLeagues()!
    }
    
    func attachView(view: FavoritsViewController) {
        self.view = view
    }
    
    func updateFavoritView(reloader : ()-> Void)  {
        reloader()
    }
    
    func deleteLeague(league : League){
        favoritLeague.removeLeague(league: league)
        view?.leaguesList = featchfavorits()
    }
    
    
    
}
