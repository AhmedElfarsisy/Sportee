//
//  HomePresenter.swift
//  SportsApp
//
//  Created by AElfarsisy on 4/17/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation

class HomePresenter : HomePresenterProtocol {
    
    var view: SportsViewController?
    var sportsRepo :SportsRepoProtocol?
    //var sportsView : SportsViewController?
    
    func attachView(view: SportsViewController) {
        self.view = view
    }
    
    
    func featchSports() {
       print("featchSports")
        sportsRepo?.getSports(completionHandler: { (sports) in
            
            self.view?.sportsList = sports
              print("completionHandler")
            //print("sports"+(sports?[1].strSport)!)
            
        }, onFailure: { (error) in
            self.view?.error = error
            print("error")
            
        })
    
        
    }
    
    func updateSportsView(reloader : ()-> Void)  {
        reloader()
    }
    
    
    
}
