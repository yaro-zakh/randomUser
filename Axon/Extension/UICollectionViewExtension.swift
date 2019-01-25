//
//  UICollectionViewExtension.swift
//  Axon
//
//  Created by Yaroslav Zakharchuk on 1/24/19.
//  Copyright © 2019 Yaroslav Zakharchuk. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func layoutCells() {
        
        let cellsWidth = UIScreen.main.bounds.width / 2 - 15
        let cellsHeight = cellsWidth
        
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: cellsWidth, height: cellsHeight)
        layout.sectionInset = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        
        self.collectionViewLayout = layout
    }
}
