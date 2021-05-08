//
//  RemoteDataSource.swift
//  SportsApp
//
//  Created by AElfarsisy on 4/17/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RemoteDataSource : RemoteDataSourceProtocol{
    
    
    let apiRequest :APIRequestProtocol
    init( apiRequest :APIRequestProtocol) {
        self.apiRequest = apiRequest
    }
    
    func getSports(completionHandler: @escaping ([Sport]?) -> Void, onFailure: @escaping (String) -> Void) {
        apiRequest.getSports(completionHandler: completionHandler, onFailure: onFailure)
        
    }
    
    func getLeagues(sportName: String, completionHandler: @escaping ([League]?) -> Void, onFailure: @escaping (String) -> Void) {
        apiRequest.getLeagues(sportName: sportName, completionHandler: completionHandler, onFailure: onFailure)
        
    }
    
    func getUpcomingEvents(id: String, completionHandler: @escaping ([Events]?) -> Void, onFailure: @escaping (String) -> Void) {
        apiRequest.getUpcomingEvents(id: id, completionHandler: completionHandler, onFailure: onFailure)
        
    }
    
    func getLatestResults(id: String, completionHandler: @escaping ([Events]?) -> Void, onFailure: @escaping (String) -> Void) {
        apiRequest.getLatestResults(id: id, completionHandler: completionHandler, onFailure: onFailure)
        
    }
    
    func getTeams(id: String, completionHandler: @escaping ([Teams]?) -> Void, onFailure: @escaping (String) -> Void) {
        apiRequest.getTeams(id: id, completionHandler: completionHandler, onFailure: onFailure)
        
    }
    
    
}


