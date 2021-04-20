//
//  LeagueRepoProtocol.swift
//  SportsApp
//
//  Created by Hanan on 4/20/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation

protocol LeagueRepoProtocol {
    
     func getLeagues(sportName: String , completionHandler :@escaping([League]?) -> Void , onFailure : @escaping (String)-> Void)
}
