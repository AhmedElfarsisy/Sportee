//
//  TeamDetailsViewController.swift
//  SportsApp
//
//  Created by Hanan on 4/29/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import UIKit

class TeamDetailsViewController: UIViewController {

    @IBOutlet weak var teamImage: UIImageView!
    
    @IBOutlet weak var teamName: UILabel!
    
    @IBOutlet weak var teamStadium: UILabel!
    
    @IBOutlet weak var teamStadiumLocation: UILabel!
    
    var team :Teams?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let team = team {
        teamName.text = team.strTeam
        teamStadium.text = team.strStadium
        teamStadiumLocation.text = team.strStadiumLocation
        teamImage.sd_setImage(with: URL(string:(team.strTeamBadge)!), placeholderImage: UIImage(named: "sport.png"))
            teamImage.layer.cornerRadius = teamImage.frame.width / 2.0
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
