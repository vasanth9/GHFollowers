//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by vasanth kumar cheepurupalli on 02/01/24.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var userName:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        NetworkManager.shared.getFollowers(for: userName, page: 1){(followers,errorMessage) in
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Bad Stuff happened", message: errorMessage!.rawValue, buttonTitle: "Ok")
                return
            }
            print("Followers Count = \(followers.count)")
            print(followers)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
