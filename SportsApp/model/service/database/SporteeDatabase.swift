//
//  SporteeDatabase.swift
//  SportsApp
//
//  Created by AElfarsisy on 4/18/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation
import UIKit
import SQLite3

class SporteeDatabase {
    static let sharedInstance = SporteeDatabase()
    private init() {
       
    }
    

   let fileURL = try! FileManager.default
          .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
          .appendingPathComponent("test.sqlite")
      
      var db: OpaquePointer?

    let createTableString = """
       CREATE TABLE Sportee(
       idLeague CHAR(255) PRIMARY KEY NOT NULL,
       strLeague CHAR(255),
       strSport CHAR(255),
       strBadge CHAR(255),
       strCountry CHAR(255),
       dateFirstEvent CHAR(255),
       strYoutube CHAR(255),
       strDescriptionEN CHAR(255)
       );
       """

    
    

         
    
    
       public func openDatabase() -> OpaquePointer? {
         
           guard case fileURL.path = fileURL.path else {
           print("part1DbPath is nil.")
           return nil
         }
           if sqlite3_open(fileURL.path, &db) == SQLITE_OK {
               print("Successfully opened connection to database at \(fileURL.path)")
               return db
         } else {
               print("Unable to open database.")
         }
           
           return nil
       }
       

  
    
    
       public func createTable() {
         // 1
         var createTableStatement: OpaquePointer?
         // 2
         if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) ==
             SQLITE_OK {
           // 3
           if sqlite3_step(createTableStatement) == SQLITE_DONE {
             print("\nContact table created.")
           } else {
             print("\nContact table is not created.")
           }
         } else {
           print("\nCREATE TABLE statement is not prepared.")
         }
         // 4
         sqlite3_finalize(createTableStatement)
       }


    

        
}

