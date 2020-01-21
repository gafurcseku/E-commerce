//
//  BaseVC.swift
//  Dhamaka
//
//  Created by Invariant on 20/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit

class BaseVC: UIViewController {
    
    let database = DhakamaSqlite.dhakamaSqlite
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "primary_color")
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.isHidden = true
        database.CreateDatabase()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if #available(iOS 13.0, *) {
            let statusBar = UIView(frame: UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
            statusBar.backgroundColor =  UIColor(named: "app_bar")
            UIApplication.shared.keyWindow?.addSubview(statusBar)
        } else {
            let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
            statusBar.backgroundColor = UIColor(named: "app_bar")
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func dismissEvent() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func dismissNav() {
        self.navigationController?.popViewController(animated: true)
    }
}
