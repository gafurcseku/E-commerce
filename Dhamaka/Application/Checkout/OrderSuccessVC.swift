//
//  OrderSuccessVC.swift
//  Dhamaka
//
//  Created by Invariant on 10/12/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit

class OrderSuccessVC: BaseVC {
    
    @IBAction func completeAction(_ sender: UIButton) {
        guard let navigationController = self.navigationController else { return }
        navigationController.popToRootViewController(animated: true)
        database.deleteAll()
        
    }
}
