//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by vasanth kumar cheepurupalli on 02/01/24.
//

import UIKit

class FollowerListVC: UIViewController {
    
    enum Section { case main }
    var userName:String!
    var followers: [Follower] = []
    
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getFollowers()
        configureDataSource()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowlayout(in: view))
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
    
    
    
    func getFollowers() {
        NetworkManager.shared.getFollowers(for: userName, page: 1){ [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success(let followers):
                self.followers = followers
                self.updateData()
            
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff happened", message: error.rawValue, buttonTitle: "Ok")
            
            }
        }
    }
    
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.set(follower:follower)
            return cell
        })
    }
    
    
    func updateData(){
        var snapshot = NSDiffableDataSourceSnapshot<Section,Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
        
        
    }
    

}
