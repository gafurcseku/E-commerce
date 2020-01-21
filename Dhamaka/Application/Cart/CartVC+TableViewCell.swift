//
//  CartVC+TableViewCell.swift
//  Dhamaka
//
//  Created by Invariant on 18/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit
import ValueStepper

class CartVCTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cartImage: UIImageView!
    @IBOutlet weak var cartProductName: UILabel!
    @IBOutlet weak var cartProductPrice: UILabel!
    @IBOutlet weak var cartProductDelete: UIButton!
    @IBOutlet weak var ProductNumber: ValueStepper!
    
}
