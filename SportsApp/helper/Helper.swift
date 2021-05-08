//
//  Helper.swift
//  SportsApp
//
//  Created by Hanan on 5/1/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    
    
    func showAlert(message: String ,view :UIViewController) {
             let alert : UIAlertController = UIAlertController(title: "Delete?", message: message, preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                     print("ok")
             }))
             alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
                 print("Cancel")
             }))
         view.present(alert, animated: true, completion: nil)
         }
    
}
