//
//  HomeViewController.swift
//  Axon
//
//  Created by Yaroslav Zakharchuk on 1/23/19.
//  Copyright © 2019 Yaroslav Zakharchuk. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var userCollectionView: UICollectionView!
    
    let networkManager = NetworkManager()
    let userCollectionViewCellID = "UserCollectionViewCell"
    var users: [Info] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibCell = UINib(nibName: userCollectionViewCellID, bundle: nil)
        userCollectionView.register(nibCell, forCellWithReuseIdentifier: userCollectionViewCellID)
//        networkManager.getUsers(completion: { (result, error) in
//            self.users = result.results
//            print(self.users[0].name?.first)
//            })
        //userCollectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: userCollectionViewCellID, for: indexPath) as! UserCollectionViewCell
        
        cell.firstName.text = "users[indexPath.row].name?.first"
        cell.lastName.text = "users[indexPath.row].name?.last"
        
        return cell
    }
}
