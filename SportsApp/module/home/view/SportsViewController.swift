//
//  SportsViewController.swift
//  SportsApp
//
//  Created by Hanan on 4/21/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "sportsCell"

class SportsViewController   : UIViewController ,SportsViewControllerProtocol {
    
    
    @IBOutlet weak var sportsCollictionView: UICollectionView!
    
    var sportsList : [Sport]?{
        didSet {
            presenter?.updateSportsView {
                sportsCollictionView.reloadData()
            }
        }
    }
    var error : String?
    
    var presenter :HomePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sportsCollictionView.delegate = self
        sportsCollictionView.dataSource = self
        
        self.mangeDependancies()
        presenter?.attachView(view: self)
        presenter?.featchSports()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        //        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        // Get the new view controller using [segue destinationViewController].
//        // Pass the selected object to the new view controller.
//    }
    
    
    func mangeDependancies()  {
        let apiRequest = APIRequest.instance
        
        let remoteDataSource = RemoteDataSource( apiRequest: apiRequest)
        
        let sportsRepo = SportsRepo(remoteDataSource: remoteDataSource)
        
        presenter = HomePresenter()
        presenter?.sportsRepo = sportsRepo
        
    }
    
}

extension SportsViewController : UICollectionViewDataSource , UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout{
    
    
    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return sportsList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SportsCell
        
        //cell.sportsImage
        let imageUrl = sportsList?[indexPath.row].strSportThumb
        cell.sportsImage!.sd_setImage(with: URL(string:imageUrl!), placeholderImage: UIImage(named: "sport.png"))
        cell.backgroundColor = UIColor.systemBlue
        cell.sportsName.text = sportsList?[indexPath.row].strSport
        
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets.zero
//    }
//

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (UIScreen.main.bounds.width / 2.0 )-5
        let cellHight = UIScreen.main.bounds.height / 3.0
        return CGSize(width: cellWidth, height: cellHight)

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let size = CGSize(width: 0, height: 2)
        return size
    }

    //to make a proper footer
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let size = CGSize(width: 0, height: 2)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let leagueViewController = storyBoard.instantiateViewController(withIdentifier: "leagueViewController") as! LeaguesViewController
        leagueViewController.sportName = sportsList?[indexPath.row].strSport
        self.present(leagueViewController, animated: true, completion: nil)
    }
    
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    
}
