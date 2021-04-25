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
    func featchfavorits() {
        //featch from db
    }
    
    func attachView(view: FavoritsViewController) {
        self.view = view
    }
    
    
}
