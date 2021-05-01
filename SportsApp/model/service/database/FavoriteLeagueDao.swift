//
//  FavoriteLeagueDao.swift
//  SportsApp
//
//  Created by Hanan on 4/30/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation
import CoreData
import UIKit
class FavoriteLeagueDao {
    
    static let shared = FavoriteLeagueDao()
    var managedContext: NSManagedObjectContext?
   // var entity :NSEntityDescription?
    private init () {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    func saveLeague(league : League) {
      
        let entity = NSEntityDescription.entity(forEntityName: "FavoritLeague", in: managedContext!)
        let leagueObj = NSManagedObject(entity: entity!, insertInto: managedContext)
        leagueObj.setValue(league.idLeague, forKey: "idLeague")
        leagueObj.setValue(league.strLeague, forKey: "strLeague")
        leagueObj.setValue(league.strBadge, forKey: "strBadge")
        leagueObj.setValue(league.strYoutube, forKey: "strYoutube")
        leagueObj.setValue(league.strDivision, forKey: "strDivision")
        do{
            try managedContext?.save()
            
        }catch let error as NSError{
            print(error)
            
            }
       
          
    }
  
    func isFovorite(leagueId: String)-> Bool{
         do {
              let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoritLeague")
             fetchRequest.predicate = NSPredicate(format: "idLeague == %@", leagueId.description)
              
            if let mContext = self.managedContext{
                  let result = try mContext.fetch(fetchRequest)
              if result.count > 0 {
                  return true
              }
                    }
                } catch let error {
                    print("IS favorit :", error)
                }
          return false
      }
    
    func fetchLeagues() -> [League]? {
        
        let fetch = NSFetchRequest<NSManagedObject>(entityName: "FavoritLeague")
        do{
            var _ : [NSManagedObject] = []
            let leagueTable = try managedContext?.fetch(fetch)
            var leagues: [League] = []
            if let leagueTable = leagueTable{
                var leg:League?
                for item in leagueTable {
                    let id = item.value(forKey:Constants.idLeague ) as! String
                    let name = item.value(forKey:Constants.strLeague ) as! String
                    let badge = item.value(forKey:Constants.strBadge)as! String
                    let devision = item.value(forKey:Constants.strDivision)as! String
                    let youtube = item.value(forKey:Constants.strYoutube)as! String
                    leg = League(idLeague: id, strLeague: name, strBadge: badge, strYoutube: youtube, strDivision: devision)
                    if let leg = leg {
                        leagues.append(leg)
                    }
                }
                
            }
            return leagues
        }catch {
            print("Error")
        }
        return nil
    }
    
    
    func removeLeague(league:League )  {
        
      DispatchQueue.global(qos: .background).async {[weak self] in
                 guard let self = self else {return}
                 do {
                     if let mContext = self.managedContext{
                     let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoritLeague")
                        fetchRequest.predicate = NSPredicate(format: "idLeague == %@", league.idLeague.description ?? "")
                         let result = try mContext.fetch(fetchRequest)
                         mContext.delete((result as! [NSManagedObject]).first!)
                         try self.managedContext?.save()
                            }
                        } catch let error {
                            print("Detele data in LeaguesEntity error :", error)
                        }
             }
    }
    
    
    
}
