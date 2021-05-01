//
//  LeaguesCell.swift
//  SportsApp
//
//  Created by Hanan on 4/22/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import UIKit

class LeaguesCell: UITableViewCell {
    
    var youtubeStr:String = ""
    var league: League?
    var showAlerts : ()->Void = {}
    @IBOutlet weak var leagueImage: UIImageView!
    
    @IBOutlet weak var leagueName: UILabel!
    
    @IBOutlet weak var youtubeBtn: UIButton!
    
    
    @IBOutlet weak var favBtn: UIButton!
    
    @IBAction func goToTrailer(_ sender: UIButton) {
        if youtubeStr != "" {
            UIApplication.shared.open(NSURL(string: "https://\(youtubeStr)")! as URL, options: [:], completionHandler: nil)
        }else{
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "displayNoLink"), object: youtubeStr)
        }
    }
    @IBAction func addFavorit(_ sender: UIButton) {
       showAlerts()
        }
        
    
}
