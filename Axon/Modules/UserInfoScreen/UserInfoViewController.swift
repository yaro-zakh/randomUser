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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var bdLabel: UILabel!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var infoUser: Info?
    override func viewDidLoad() {
        super.viewDidLoad()

        photoUser.load(url: infoUser?.picture?.large)
        photoUser.border()
        if let name = infoUser?.name {
            nameLabel.text = name.first!.capitalizingFirstLetter() + " " + name.last!.capitalizingFirstLetter()
            genderLabel.text = infoUser?.gender?.capitalizingFirstLetter()
            bdLabel.text = getFormattedDate(oldDate: infoUser?.dob?.date)
            cellLabel.text = infoUser?.cell
            cityLabel.text = infoUser?.location?.city?.capitalizingFirstLetter()
        }
    }

    func getFormattedDate(oldDate: Date?) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd"
        
        let date: Date? = dateFormatterGet.date(from: dateFormatterGet.string(from: oldDate!))
        return dateFormatterPrint.string(from: date!);
    }
    
}
