//
//  ProductContentVC.swift
//  Dhamaka
//
//  Created by Invariant on 2/1/20.
//  Copyright © 2020 invariant. All rights reserved.
//

import Foundation
import UIKit

class ProductContentVC: BaseVC {
    
    var productDescription: String = ""
    
    @IBOutlet weak var descriptionUITextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descriptionUITextView.text = productDescription
    }
}
