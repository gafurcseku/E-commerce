//
//  HomeVC+CollectionViewCell.swift
//  Dhamaka
//
//  Created by Invariant on 12/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit
import Cosmos

class HomeVCCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productRating: CosmosView!
    @IBOutlet weak var productPrice: UILabel!
}
