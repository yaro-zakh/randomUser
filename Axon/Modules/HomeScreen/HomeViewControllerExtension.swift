//
//  HomeViewControllerExtension.swift
//  Axon
//
//  Created by Yaroslav Zakharchuk on 1/23/19.
//  Copyright © 2019 Yaroslav Zakharchuk. All rights reserved.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: userCollectionViewCellID, for: indexPath) as! UserCollectionViewCell
        
        let user = users[indexPath.row]
        cell.photoUser.load(url: user.picture?.large)
        cell.firstName.text = user.name?.first
        cell.lastName.text = user.name?.last
        cell.layer.cornerRadius = 20
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.info = users[indexPath.row]
        self.performSegue(withIdentifier: "userIdentifier", sender: self)
    }
}
