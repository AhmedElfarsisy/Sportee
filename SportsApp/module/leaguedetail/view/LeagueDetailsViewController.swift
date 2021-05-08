//
//  LeagueDetailsViewController.swift
//  SportsApp
//
//  Created by Hanan on 4/27/21.
//  Copyright © 2021 AElfarsisy. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LeagueDetailsViewController: UIViewController , LeagueDetailsProtocol ,UICollectionViewDelegateFlowLayout{
    //MARK:-properties
    var leagueId :String?
    var league : League?
    var presenter : LeagueDetailPresenterProtocol?
    var index :String?
    
    var upComingEvents : [Events]?
    {
        didSet {
            presenter?.updateLeagueDetailsView {
                prepareObservale()
                upComingEventsCollectionView.reloadData()
            }
        }
    }
    var lastResultsList : [Events]?
    {
        didSet {
            presenter?.updateLeagueDetailsView {
                prepareObservaleForLastResult()
                lastEventsCollectionView.reloadData()
            }
        }
    }
    
    
    var teamsList: [Teams]?
    {
        didSet {
            presenter?.updateLeagueDetailsView {
                prepareObservaleForTeams()
                teamsCollectionView.reloadData()
            }
        }
    }
    var upComingEventsDeiver: Driver<[Events]>?
    private var dataSubject = PublishSubject<[Events]>()
    var lastEventDriver: Driver<[Events]>?
    private var dataSubjectLastEvents = PublishSubject<[Events]>()
    var teamsDriver: Driver<[Teams]>?
    private var dataSubjectTeams = PublishSubject<[Teams]>()
    @IBOutlet weak var upComingEventsCollectionView: UICollectionView!
    @IBOutlet weak var lastEventsCollectionView: UICollectionView!
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
    @IBOutlet weak var favoritBtn: UIButton!
    
    var favFlage : Bool = false
    
    var error : String?
    let disposeBag = DisposeBag()
    
    
    //MARK:-Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        mangeDependancies()
        presenter?.attachView(view: self)
        if let leagueId = leagueId {
            presenter?.featchUpcomingEvents(id: leagueId)
            presenter?.featchLastResult(id: leagueId)
            presenter?.featchTeams(id: leagueId)
            
        }
        upComingEventsDeiver = dataSubject.asDriver(onErrorJustReturn: [])
        lastEventDriver = dataSubjectLastEvents.asDriver(onErrorJustReturn:[] )
        teamsDriver = dataSubjectTeams.asDriver(onErrorJustReturn:[] )
        
        
        observeOnData()
        observeLastEventsData()
        observeOnTeamsData()
        if let league = league {
        
            if FavoriteLeagueDao.shared.isFovorite(leagueId: league.idLeague ){
              favoritBtn.setImage( UIImage(named: "Saved.png"), for: .normal)
        }
        else {
             favoritBtn.setImage( UIImage(named: "SavedEmp.png"), for: .normal)
            }}
    }
    
    func prepareObservale() {
        if let upComingEvents = upComingEvents
        {
            self.dataSubject.onNext(upComingEvents)
        }
    }
    
    func prepareObservaleForLastResult() {
        if let lastResultsList = lastResultsList {
            self.dataSubjectLastEvents.onNext(lastResultsList)
        }
    }
    
    func prepareObservaleForTeams()  {
        if let teamsList = teamsList {
            self.dataSubjectTeams.onNext(teamsList)
        }
    }
    
    func observeOnData() {
        upComingEventsDeiver?.drive(self.upComingEventsCollectionView.rx.items(cellIdentifier: "upcomingCell")){row,item,cell in
            (cell as? UpComingEventsCell)?.upComingEventDate.text = item.dateEvent
            
            print( item.dateEvent)
            (cell as? UpComingEventsCell)?.upComingEventImage!.sd_setImage(with: URL(string:item.strThumb!), placeholderImage: UIImage(named: "sport.png"))
            
            (cell as? UpComingEventsCell)?.upComingEventImage.layer.cornerRadius = 15
            
        }.disposed(by: self.disposeBag)
        
    }
    
    func observeLastEventsData ()  {
        lastEventDriver?.drive(self.lastEventsCollectionView.rx.items(cellIdentifier: "lastEvents")){row,item,cell in
            (cell as? LastEventsCell)?.homeTeam!.text = item.strHomeTeam
            (cell as? LastEventsCell)?.awayTeam!.text = item.strAwayTeam
            (cell as? LastEventsCell)?.homeScore!.text = item.intHomeScore
            (cell as? LastEventsCell)?.awayScore!.text = item.intAwayScore
            (cell as? LastEventsCell)?.time!.text = item.strTime
            (cell as? LastEventsCell)?.dateLabel!.text = item.dateEvent
            (cell as? LastEventsCell)?.layer.cornerRadius = 15
        }.disposed(by: self.disposeBag)
    }
    func observeOnTeamsData() {
        teamsDriver?.drive(self.teamsCollectionView.rx.items(cellIdentifier: "teamsCell")){row,item,cell in
            (cell as? TeamsCell)?.teamName.text = item.strTeam
            
            (cell as? TeamsCell)?.teamImage!.sd_setImage(with: URL(string:item.strTeamBadge!), placeholderImage: UIImage(named: "sport.png"))
            self.index = item.idTeam!
            (cell as? TeamsCell)?.teamImage.layer.cornerRadius = ((cell as? TeamsCell)?.teamImage.frame.width)! / 2.0
            
        }.disposed(by: self.disposeBag)
        
    }

    
    func mangeDependancies()  {
        let apiRequest = APIRequest.instance
        
        let remoteDataSource = RemoteDataSource( apiRequest: apiRequest)
        
        let upComingRepo = LeagueDetailsRepo(remoteDataSource: remoteDataSource)
        
        presenter = LeagueDetailPresenter()
        presenter?.leagueDetailsRepo = upComingRepo
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (UIScreen.main.bounds.width / 2.0 )-5
        let cellHight = UIScreen.main.bounds.height
        return CGSize(width: cellWidth, height: cellHight)
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
            var teamDetails :TeamDetailsViewController = segue.destination as! TeamDetailsViewController
            if let index = index{
                
                for item in teamsList! {
                    if index == item.idTeam {
                       teamDetails.team = item
                    }
                }
              
            }
    
        }
    
    @IBAction func addFavorit(_ sender: Any) {
        if let league = league{
            presenter?.addLeague(league:league )
            favoritBtn.setImage( UIImage(named: "Saved.png"), for: .normal)

    }
    }
    
}
