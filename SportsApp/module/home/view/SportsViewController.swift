//
//  SportsViewController.swift
//  SportsApp
//
//  Created by Hanan on 4/21/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import UIKit

private let reuseIdentifier = "sportsCell"

class SportsViewController   : UIViewController {
    
    @IBOutlet weak var sportsCollictionView: UICollectionView!
    
    @IBOutlet weak var sportsImage: UIImageView!
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
        let apiRequest = APIRequest.instance
        
        let remoteDataSource = RemoteDataSource( apiRequest: apiRequest)
        
        let sportsRepo = SportsRepo(remoteDataSource: remoteDataSource)
        
        presenter = HomePresenter()
        presenter?.sportsRepo = sportsRepo
        
    }
    
}

extension SportsViewController : UICollectionViewDataSource , UICollectionViewDelegate {
    
    
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SportsCell
        
        //cell.sportsImage
        cell.sportsName.text = sportsList?[indexPath.row].strSport
        
        return cell
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
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
}
