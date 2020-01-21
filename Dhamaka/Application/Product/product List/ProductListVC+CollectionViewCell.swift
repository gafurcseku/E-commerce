//
//  ProductListVC+CollectionViewCell.swift
//  Dhamaka
//
//  Created by Invariant on 26/12/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit
import Cosmos

class ProductListVCCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productRating: CosmosView!
    @IBOutlet weak var productPrice: UILabel!
}
