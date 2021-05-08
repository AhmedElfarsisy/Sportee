//
//  FavoritsViewController.swift
//  SportsApp
//
//  Created by Hanan on 4/22/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import UIKit

class FavoritsViewController: UIViewController {
    
    @IBOutlet weak var favoritCollictionView: UICollectionView!
    
    var error : String?
    
    var presenter :FavoritePresenterProtocol?
    
    public  var leaguesList : [League]?{
        didSet {
            presenter?.updateFavoritView{
                favoritCollictionView.reloadData()
                
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritCollictionView.delegate = self
        favoritCollictionView.dataSource = self
        self.mangeDependancies()
        presenter?.attachView(view: self)
        
    }
    
    func mangeDependancies()  {
        presenter = FavoritePresenter()
    }
    
    
}

extension FavoritsViewController : UICollectionViewDataSource , UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout{
    
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return leaguesList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoritCell", for: indexPath) as! FavoritCell
        
        let imageUrl = leaguesList?[indexPath.row].strBadge
        cell.favoritImage!.sd_setImage(with: URL(string:imageUrl!), placeholderImage: UIImage(named: "sport.png"))
        cell.favoritImage.layer.cornerRadius = cell.favoritImage.frame.width / 2.0
        cell.favoritName.text = leaguesList?[indexPath.row].strLeague
        //cell.league = leaguesList?[indexPath.row]
        //cell.index = indexPath.row
        cell.showAlerts = {
            self.showAlert(index:indexPath.row )
        }
        cell.url = leaguesList![indexPath.row].strYoutube ?? ""
        NotificationCenter.default.addObserver(self, selector: #selector(displayNoLink), name: NSNotification.Name(rawValue: "displayNoLink"), object: nil)
        //favoritCollictionView.reloadData()
        return cell
    }
    @objc func displayNoLink(){
        let alert : UIAlertController = UIAlertController(title: "Alert", message: "Sorry! Link Not Found", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            print("ok")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (UIScreen.main.bounds.width )
        let cellHight = UIScreen.main.bounds.height / 10.0
        return CGSize(width: cellWidth, height: cellHight)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let leagueDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "leagueDetailsViewController") as! LeagueDetailsViewController
        leagueDetailsViewController.leagueId = leaguesList?[indexPath.row].idLeague
        leagueDetailsViewController.league = leaguesList?[indexPath.row]
        self.present(leagueDetailsViewController, animated: true, completion: nil)
    }
    
         func showAlert(index : Int) {
             let alert : UIAlertController = UIAlertController(title: "Delete?", message: "Do you want to delete this legue", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                self.presenter?.deleteLeague(league: self.leaguesList![index])
                     self.favoritCollictionView.reloadData()
                     print("ok")
             }))
             alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
                 print("Cancel")
             }))
    
           self.present(alert, animated: true, completion: nil)
         }
    
    
    override func viewWillAppear(_ animated: Bool) {
        leaguesList = presenter?.featchfavorits()
        favoritCollictionView.reloadData()
    }
        
}
