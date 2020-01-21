//
//  ForgotMobileVC.swift
//  Dhamaka
//
//  Created by Invariant on 26/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit

class ForgotMobileVC: BaseVC {
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        print(self.navigationController as Any)
        print(self.navigationController?.presentingViewController as Any)
        print(self.navigationController?.presentedViewController as Any)
        print(self.presentingViewController as Any)
        print(self.presentedViewController as Any)
    }
}
