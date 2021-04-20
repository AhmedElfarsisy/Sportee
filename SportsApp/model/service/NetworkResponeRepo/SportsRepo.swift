//
//  SportsRepo.swift
//  SportsApp
//
//  Created by Hanan on 4/20/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation
class SportsRepo : SportsRepoProtocol {
    let remoteDataSource :RemoteDataSourceProtocol
    
    init(remoteDataSource :RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getSports(completionHandler: @escaping ([Sport]?) -> Void, onFailure: @escaping (String) -> Void) {
        remoteDataSource.getSports(completionHandler: completionHandler, onFailure: onFailure)
        
    }
    
    
}
