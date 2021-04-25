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
    
    var sportsList : [Sport]?{
        didSet {
            //presenter?.updateSportsView {
            print("Sports list did set")
            favoritCollictionView.reloadData()
            }
        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritCollictionView.delegate = self
        favoritCollictionView.dataSource = self
        self.mangeDependancies()
        presenter?.attachView(view: self)
        sportsList = Array<Sport>()
        sportsList?.append(Sport(idSpor: 5, strSport: "Soccer", strFormat: "", strSportThumb: "", strSportThumbGreen: "String", strSportDescription: "String"))
        
          sportsList?.append(Sport(idSpor: 6, strSport: "Soccer", strFormat: "", strSportThumb: "", strSportThumbGreen: "String", strSportDescription: "String"))
        //presenter?.featchSports()
        
        //        for item in sportsList! {
        //            print(item.strSport)
        //        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        //        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    func mangeDependancies()  {
//        let apiRequest = APIRequest.instance
//
//        let remoteDataSource = RemoteDataSource( apiRequest: apiRequest)
//
//        let sportsRepo = SportsRepo(remoteDataSource: remoteDataSource)
        
        presenter = FavoritePresenter()
        //presenter?.sportsRepo = sportsRepo
        
    }
    
}

extension FavoritsViewController : UICollectionViewDataSource , UICollectionViewDelegate {
    
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return sportsList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoritCell", for: indexPath) as! FavoritCell
        
        //cell.sportsImage
        let imageUrl = sportsList?[indexPath.row].strSportThumb
        cell.favoritImage!.sd_setImage(with: URL(string:imageUrl!), placeholderImage: UIImage(named: "sport.png"))
        
        cell.favoritName.text = sportsList?[indexPath.row].strSport
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = UIScreen.main.bounds.width / 2.0
        let cellHight = UIScreen.main.bounds.height / 5.0
        return CGSize(width: cellWidth, height: cellHight)
    }
    
}
