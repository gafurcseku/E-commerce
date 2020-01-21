//
//  ShopDetailCollectionViewCell.swift
//  Dhamaka
//
//  Created by Invariant on 16/1/20.
//  Copyright © 2020 invariant. All rights reserved.
//

import UIKit
import Cosmos

class ShopDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var pricelabel: UILabel!
}
