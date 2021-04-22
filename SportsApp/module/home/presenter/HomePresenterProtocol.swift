//
//  HomePresenterProtocol.swift
//  SportsApp
//
//  Created by AElfarsisy on 4/17/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation
 
protocol  HomePresenterProtocol {
    //var sportsRepo :SportsRepoProtocol?
    func featchSports()
    func attachView (view : SportsViewController)
}
