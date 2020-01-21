//
//  HomeVC.swift
//  Dhamaka
//
//  Created by Invariant on 6/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit
import Apollo
import SideMenuSwift


class HomeVC: BaseVC {
    
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var cartButton: MIBadgeButton!
    
    
    let viewModel = HomeVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        viewModel.getProductList(page: 1, limit: 100) { (isSuccess) in
            if isSuccess {
                //self.homeTableView.rowHeight = CGFloat((self.viewModel.products.count/3)*170)
                self.homeTableView.reloadData()
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
          cartButton.badgeString = "\(database.productCount())"
      }
    
    func prepareTableView() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    
    @IBAction func userLoginAction(_ sender: Any) {
        ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.Autho.rawValue, identifier: "autho", context:self)
   //  ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.ResetPassword.rawValue, identifier: "ForgotPasswordVC", context:self)
        
       let storyboard = UIStoryboard(name: storyBoardName.ResetPassword.rawValue, bundle: nil)
       let vc = storyboard.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        let navController = UINavigationController(rootViewController: vc)
        self.present(navController, animated:true, completion: nil)
    }
    
    @IBAction func menuButtonDidClicked(_ sender: UIButton) {
        sideMenuController?.revealMenu()
    }
    
    
    @IBAction func cartAction(_ sender: UIButton) {
     let cartVC = ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.Cart.rawValue, identifier:"cart")
    self.navigationController?.pushViewController(cartVC, animated: true)
    }
    
    
}

extension HomeVC : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionType.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionValue = viewModel.sectionValue(section: section)
        return sectionValue.1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionValue = viewModel.sectionValue(section: section)
        if sectionValue.0 {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! HomeVCTableViewCell
        cell.setCollectionViewDataSourceDelegate(context:self, forRow: viewModel.prodcutCount() , viewModel: viewModel)
        let height = cell.collectionView.collectionViewLayout.collectionViewContentSize.height
        cell.collectionViewHeight.constant = height
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
