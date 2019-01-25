//
//  HomeViewController.swift
//  Axon
//
//  Created by Yaroslav Zakharchuk on 1/23/19.
//  Copyright © 2019 Yaroslav Zakharchuk. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let networkManager = NetworkManager()
    
    @IBOutlet weak var userCollectionView: UICollectionView!
    
    
    let userCollectionViewCellID = "UserCollectionViewCell"
    let segueIdentifier = "userIdentifier"
    
    var users: [Info] = []
    var info: Info?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()

        fetchUsers()
    }
    
    private func fetchUsers() {
        networkManager.obtainUsers(completion: { (result, error) in
            self.users = result.results
            self.userCollectionView.reloadData()
        })
    }
    
    private func registerCells() {
        userCollectionView.register(UINib(nibName: userCollectionViewCellID, bundle: nil), forCellWithReuseIdentifier: userCollectionViewCellID)
        userCollectionView.layoutCells()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dectinationView: UserInfoViewController = segue.destination as! UserInfoViewController
        dectinationView.infoUser = self.info
    }
}
