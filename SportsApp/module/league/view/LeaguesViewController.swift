//
//  LeaguesViewController.swift
//  SportsApp
//
//  Created by Hanan on 4/22/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//
import UIKit

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
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
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

        //(cell.leagueImage.layer.width / 2.0 )
        let imageUrl = leaguesList?[indexPath.row].strBadge
        cell.leagueImage!.sd_setImage(with: URL(string:imageUrl!), placeholderImage: UIImage(named: "sport.png"))
        return cell
    }
    
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let leagueDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "leagueDetailsViewController") as! LeagueDetailsViewController
        leagueDetailsViewController.leagueId = leaguesList?[indexPath.row].idLeague
        self.present(leagueDetailsViewController, animated: true, completion: nil)
    }
    
    
    
    //  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //
    //        return 200
    //    }
    
}

extension LeaguesViewController  {
    
    
    
  
}
