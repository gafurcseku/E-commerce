//
//  BaseNavigationVC.swift
//  Dhamaka
//
//  Created by Invariant on 26/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit

class BaseNavigationVC: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.orange
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
}
