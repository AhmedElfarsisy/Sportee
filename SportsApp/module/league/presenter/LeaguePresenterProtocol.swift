//
//  LeaguePresenterProtocol.swift
//  SportsApp
//
//  Created by AElfarsisy on 4/17/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation

protocol LeaguePresenterProtocol {
    func featchLeagues(name :String)
      func attachView (view : LeaguesViewController)
}
