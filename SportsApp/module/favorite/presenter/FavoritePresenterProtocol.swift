//
//  FavoritePresenterProtocol.swift
//  SportsApp
//
//  Created by AElfarsisy on 4/17/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation

protocol  FavoritePresenterProtocol {
    //var sportsRepo :SportsRepoProtocol?
    func featchfavorits()-> [League]
    func attachView (view : FavoritsViewController)
    func updateFavoritView(reloader : ()-> Void)
     func deleteLeague(league : League)
}

