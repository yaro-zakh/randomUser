//
//  UserInfoViewController.swift
//  Axon
//
//  Created by Yaroslav Zakharchuk on 1/24/19.
//  Copyright © 2019 Yaroslav Zakharchuk. All rights reserved.
//

import UIKit

fileprivate enum ChooseInfo: Int {
    case name = 0, gender, birthday, cell, city
    
    func number() -> Int {
        return self.rawValue
    }
}

class UserInfoViewController: UIViewController {

    @IBOutlet weak var photoUser: UIImageView!
    @IBOutlet weak var someInfoLabel: UILabel!
    @IBOutlet weak var selectInfo: UISegmentedControl!
    
    var infoUser: Info?
    override func viewDidLoad() {
        super.viewDidLoad()

        photoUser.load(url: infoUser?.picture?.large)
        photoUser.border()
        if let name = infoUser?.name {
            someInfoLabel.text = name.first!.capitalizingFirstLetter() + " " + name.last!.capitalizingFirstLetter()
        }
    }
    @IBAction func chooseInfoButton(_ sender: UISegmentedControl) {
        changeInfo()
    }
    
    func changeInfo() {
        
        switch selectInfo.selectedSegmentIndex {
        case ChooseInfo.name.number():
            someInfoLabel.text = (infoUser?.name?.first?.capitalizingFirstLetter())! + " " + (infoUser?.name?.last?.capitalizingFirstLetter())!
        case ChooseInfo.gender.number():
            someInfoLabel.text = infoUser?.gender?.capitalizingFirstLetter()
        case ChooseInfo.birthday.number():
            someInfoLabel.text = getFormattedDate(oldDate: infoUser?.dob?.date)
        case ChooseInfo.cell.number():
            someInfoLabel.text = infoUser?.cell
        case ChooseInfo.city.number():
            someInfoLabel.text = infoUser?.location?.city?.capitalizingFirstLetter()
        default:
            break
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
