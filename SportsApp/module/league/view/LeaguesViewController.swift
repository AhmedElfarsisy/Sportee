//
//  LeaguesViewController.swift
//  SportsApp
//
//  Created by Hanan on 4/22/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//
import UIKit
import RxCocoa
import RxSwift

class LeaguesViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    var presenter : LeaguePresenter?
    var error : String?
    var sportName : String?
    var leaguesList : [League]?
    {
        didSet{
            presenter?.updateView{
                self.leaguesTable.reloadData()
            }
            
        }
    }
    
    @IBOutlet weak var leaguesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leaguesTable.delegate = self
        leaguesTable.dataSource = self
        
        mangeDependancies()
        presenter?.attachView(view: self)
        presenter?.featchLeagues(name: sportName!)
       
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.leaguesTable.reloadData()
    }
    
    
    func mangeDependancies()  {
        let apiRequest = APIRequest.instance
        
        let remoteDataSource = RemoteDataSource( apiRequest: apiRequest)
        
        let leagueRepo = LeaguesRepo(remoteDataSource: remoteDataSource)
        
        presenter = LeaguePresenter()
        presenter?.leagueRepo = leagueRepo
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        print(leaguesList?.count )
        return leaguesList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell", for: indexPath) as! LeaguesCell
        cell.leagueName.text = leaguesList![indexPath.row].strLeague
        cell.leagueImage.layer.cornerRadius = cell.leagueImage.frame.width / 2.0

        let imageUrl = leaguesList?[indexPath.row].strBadge
        cell.leagueImage!.sd_setImage(with: URL(string:imageUrl!), placeholderImage: UIImage(named: "sport.png"))
        cell.league = leaguesList![indexPath.row]
        cell.youtubeStr = leaguesList![indexPath.row].strYoutube ?? ""
               NotificationCenter.default.addObserver(self, selector: #selector(displayNoLink), name: NSNotification.Name(rawValue: "displayNoLink"), object: nil)
        return cell
    }
    
    @objc func displayNoLink(){
                     let alert : UIAlertController = UIAlertController(title: "Alert", message: "Sorry! Link Not Found", preferredStyle: .alert)
                     alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                         print("ok")
                     }))
                     self.present(alert, animated: true, completion: nil)
     }
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let leagueDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "leagueDetailsViewController") as! LeagueDetailsViewController
        leagueDetailsViewController.leagueId = leaguesList?[indexPath.row].idLeague
        leagueDetailsViewController.league = leaguesList?[indexPath.row]
        self.present(leagueDetailsViewController, animated: true, completion: nil)
    }
    

    
}

extension LeaguesViewController  {
    
    
    
  
}
