//
//  FavoriteLeagueDao.swift
//  SportsApp
//
//  Created by AElfarsisy on 4/18/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation
 import CoreData
class FavoriteLeagueDao {

        static let shared = FavoriteLeagueDao()
       var  entity : NSEntityDescription?
        var managedContext: NSManagedObjectContext?
        private init () {
            
        }
        
        func setEntityAndManagedContext(entity : NSEntityDescription, managedContext: NSManagedObjectContext) {
            self.entity = entity
            self.managedContext = managedContext
        }
        
        func saveLeague(league : LeagueDetail) {
            let leagueTable = NSManagedObject(entity: entity!, insertInto: managedContext)
            
            leagueTable.setValue(league.idLeague, forKey: "id")
            leagueTable.setValue(league.strLeague, forKey: "leagueName")
            leagueTable.setValue(league.strBadge, forKey: "badge")
            leagueTable.setValue(league.strSport, forKey: "sportName")
            leagueTable.setValue(league.dateFirstEvent, forKey: "eventDate")
            leagueTable.setValue(league.strCountry, forKey: "country")
            leagueTable.setValue(league.strYoutube, forKey: "youtubelink")
            leagueTable.setValue(league.strDescriptionEN, forKey: "leagueDesc")

            do{
                try managedContext?.save()
                
            }catch let error as NSError{
                print(error)
                
            }
        }
        
        func fetchLeagues() -> [NSManagedObject]? {
            
            let fetch = NSFetchRequest<NSManagedObject>(entityName: "Sportee")
            do{
                var leagueList : [NSManagedObject] = []

                let leagueTable = try managedContext?.fetch(fetch)
               
                return leagueTable
            }catch{
                
            }
            return nil
        }
        
    }
