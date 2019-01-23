//
//  HomeViewController.swift
//  Axon
//
//  Created by Yaroslav Zakharchuk on 1/23/19.
//  Copyright © 2019 Yaroslav Zakharchuk. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let networkManager = NetworkManager()
    var allUser = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.getUsers(completion: { (result, error) in
            print(result!)
            })
    }
}
