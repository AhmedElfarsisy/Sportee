//
//  FavoritCell.swift
//  SportsApp
//
//  Created by Hanan on 4/22/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import UIKit

class FavoritCell: UICollectionViewCell {
   // var league:League?
    var index : Int?
    var url:String?
    var showAlerts :() -> Void = {}
    
    @IBOutlet weak var favoritImage: UIImageView!
    
    @IBOutlet weak var favoritName: UILabel!
    
    @IBOutlet weak var youtubeBtn: UIButton!
    
    @IBOutlet weak var favoritOutletBtn: UIButton!
    
    @IBAction func openYoutube(_ sender: Any) {
        if url != "" {
            if let url = url {
                UIApplication.shared.open(NSURL(string: "https://\(url)")! as URL, options: [:], completionHandler: nil)
            }
          
        }else{
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "displayNoLink"), object: url)
        }
        
    }
    
    @IBAction func removeFromFavorit(_ sender: Any) {
       showAlerts()
    }
    
    
}
