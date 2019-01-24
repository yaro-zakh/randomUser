//
//  UIImageExtension.swift
//  Axon
//
//  Created by Yaroslav Zakharchuk on 1/24/19.
//  Copyright © 2019 Yaroslav Zakharchuk. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL?) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    func border() {
        //self.layer.borderColor =  //UIColor(red:0.00, green:0.44, blue:0.10, alpha:1.0)
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
}
