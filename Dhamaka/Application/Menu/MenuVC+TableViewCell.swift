//
//  MenuVC+TableViewCell.swift
//  Dhamaka
//
//  Created by Invariant on 11/12/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit


open class MenuVCTableViewCell: ExpandableCell {
    static let ID = "ExpandableCell"
    
    @IBOutlet weak var titleLabel: UILabel!
}

open class MenuVCNornalTableViewCell: UITableViewCell {
     static let ID = "ExpandedCell"
    @IBOutlet weak var childTitleLabel: UILabel!
}
