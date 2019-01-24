//
//  UserInfoViewController.swift
//  Axon
//
//  Created by Yaroslav Zakharchuk on 1/24/19.
//  Copyright © 2019 Yaroslav Zakharchuk. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet weak var photoUser: UIImageView!
    @IBOutlet weak var someInfoLabel: UILabel!
    @IBOutlet weak var selectInfo: UISegmentedControl!
    
    var infoUser: Info?
    override func viewDidLoad() {
        super.viewDidLoad()

        photoUser.load(url: infoUser?.picture?.large)
        someInfoLabel.text = (infoUser?.name?.first)! + " " + (infoUser?.name?.last)!
    }

}
