//
//  ViewTransaction.swift
//  Dhamaka
//
//  Created by Invariant on 21/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit

enum storyBoardName:String {
    case main = "Main"
    case Product = "ProuctDetails"
    case Cart = "Cart"
    case Autho = "Autho"
    case ResetPassword = "ResetPassword"
    case ProductList = "ProductList"
    case Histroy = "Histroy"
    case ShopList = "ShopList"
}

class ViewTransaction {
    
    static var viewTransaction = ViewTransaction()
    
    func TransactionView(name:String, identifier:String , context: UIViewController) {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let storyVC = storyboard.instantiateViewController(withIdentifier: identifier) as UIViewController
        storyVC.modalPresentationStyle = .fullScreen
        context.present(storyVC, animated: true, completion: nil)
    }
    
    func TransactionView(name:String, identifier:String) -> UIViewController {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let storyVC = storyboard.instantiateViewController(withIdentifier: identifier) as UIViewController
        storyVC.modalPresentationStyle = .fullScreen
        return storyVC
    }
    
}
