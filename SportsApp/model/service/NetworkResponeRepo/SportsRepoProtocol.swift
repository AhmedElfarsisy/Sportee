//
//  SportsRepoProtocol.swift
//  SportsApp
//
//  Created by Hanan on 4/20/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation
protocol SportsRepoProtocol {
  
 func getSports(completionHandler :@escaping ([Sport]?) -> Void , onFailure : @escaping (String)-> Void)
    
}
