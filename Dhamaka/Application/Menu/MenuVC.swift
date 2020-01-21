//
//  MenuVC.swift
//  Dhamaka
//
//  Created by Invariant on 11/12/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD
import SideMenuSwift


class MenuVC : BaseVC {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var menuTableView: ExpandableTableView!
    
    let viewModel = MenuVM()
    let userManagerViewModel = UserManagerVM()
    var parentPosition:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userImageView.makeRounded()
       
        viewModel.getCategory { (isSuccess) in
            if(isSuccess){
                self.menuTableView.reloadData()
            }
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(MenuVC.userLogin))
        userImageView.addGestureRecognizer(tap)
        userImageView.isUserInteractionEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showUserInformation()
         prepairTableView()
        viewModel.categoryList = BISingletonHelper.shared.categoryList
        self.menuTableView.reloadData()
    }
    
    @objc func userLogin(){
        userManagerViewModel.getLoginUser(userId: Helper.getUserID, isProgress: false) { (isSuccess) in
            if(isSuccess){
                self.userManagerViewModel.goProfile(navigationController: self.navigationController)
            }else {
                self.userManagerViewModel.goLogin(navigationController: self.navigationController)
            }
        }
    }
    
    func prepairTableView() {
        self.menuTableView.expandableDelegate = self
        self.menuTableView.animation = .automatic
        self.menuTableView.expansionStyle = .single
        menuTableView.register(UINib(nibName: "ExpandedCell", bundle: nil), forCellReuseIdentifier: MenuVCNornalTableViewCell.ID)
        menuTableView.register(UINib(nibName: "ExpandableCell", bundle: nil), forCellReuseIdentifier: MenuVCTableViewCell.ID)
    }
    
    fileprivate func getUserUI() {
        self.userNameLabel.text = userManagerViewModel.userName
        self.userEmailLabel.text = userManagerViewModel.userEmail
        userImageView.sd_setImage(with: URL(string: "\(Dhamaka.imageBasseUrl)\(userManagerViewModel.userImage)"), placeholderImage: UIImage(named: "user default image"))
    }
    
    func showUserInformation() {
        userManagerViewModel.getLoginUser(userId: Helper.getUserID, isProgress: false) { (isSuccess) in
            if(isSuccess){
                self.getUserUI()
            }
        }
    }
}


extension MenuVC : ExpandableDelegate {
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightsForExpandedRowAt indexPath: IndexPath) -> [CGFloat]? {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0...viewModel.getCount():
                return [50]
            default:
                break
            }
        default:
            break
        }
        return nil
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCellsForRowAt indexPath: IndexPath) -> [UITableViewCell]? {
        switch indexPath.section {
        case 0:
            var cellList:[UITableViewCell] = []
            if(viewModel.getChildCount(indexPath.row) > 0){
                for n in 0...(viewModel.getChildCount(indexPath.row) - 1 ){
                    let cell = menuTableView.dequeueReusableCell(withIdentifier: MenuVCNornalTableViewCell.ID) as! MenuVCNornalTableViewCell
                    cell.childTitleLabel.text = viewModel.getChildTitle(indexPath.row, n)
                    cellList.append(cell)
                }
            }
            return cellList
            
        default:
            break
        }
        return nil
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = expandableTableView.cellForRow(at: indexPath) as? MenuVCTableViewCell {
            print("\(viewModel.getChildId(cell.titleLabel.text ?? ""))")
            
            if(viewModel.getChildId(cell.titleLabel.text ?? "") == "logout"){
                Helper.showAlert(from: self, message: "Do you Want to Logout",completion:{ (isSuccess) in
                    if(isSuccess){
                        Helper.setLoggedIn(to: false)
                        self.getUserUI()
                        self.sideMenuController?.hideMenu()
                    }
                })
            }else if(viewModel.getChildId(cell.titleLabel.text ?? "") == "histroy"){
                userManagerViewModel.getLoginUser(userId: Helper.getUserID, isProgress: false) { (isSuccess) in
                    if(isSuccess){
                        self.userManagerViewModel.goHistory(navigationController: self.navigationController)
                       self.sideMenuController?.hideMenu()
                    }else{
                        self.userManagerViewModel.goLogin(navigationController: self.navigationController)
                    }
                }
            }else if(viewModel.getChildId(cell.titleLabel.text ?? "") == "shop"){
                userManagerViewModel.getLoginUser(userId: Helper.getUserID, isProgress: false) { (isSuccess) in
                    if(isSuccess){
                        self.userManagerViewModel.goShopList(navigationController: self.navigationController)
                       self.sideMenuController?.hideMenu()
                    }else{
                        self.userManagerViewModel.goLogin(navigationController: self.navigationController)
                    }
                }
            }
        }
        
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCell: UITableViewCell, didSelectExpandedRowAt indexPath: IndexPath) {
        if let cell = expandedCell as? MenuVCNornalTableViewCell {
            print("\(viewModel.getChildId(cell.childTitleLabel.text ?? ""))")
            if(viewModel.getChildId(cell.childTitleLabel.text ?? "") == "profile"){
                
                userManagerViewModel.getLoginUser(userId: Helper.getUserID, isProgress: false) { (isSuccess) in
                    if(isSuccess){
                        self.userManagerViewModel.goProfile(navigationController: self.navigationController)
                        self.sideMenuController?.hideMenu()
                    }else{
                        self.userManagerViewModel.goLogin(navigationController: self.navigationController)
                    }
                }
            }else {
                let navController = ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.ProductList.rawValue, identifier: "productList") as! ProductListVC
                navController.category_id = viewModel.getChildId(cell.childTitleLabel.text ?? "")
                self.navigationController?.pushViewController(navController, animated:true)
                self.sideMenuController?.hideMenu()
            }
        }
    }
    
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCount()
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = expandableTableView.dequeueReusableCell(withIdentifier:MenuVCTableViewCell.ID) as! MenuVCTableViewCell
        cell.titleLabel.text = viewModel.getParentTitle(indexPath.row)
        
        return cell
    }
    
    func expandableTableView(_ expandableTableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    private func setAutho(complete:@escaping ((Bool) -> Void)){
        
        userManagerViewModel.getLoginUser(userId: Helper.getUserID, isProgress: false) { (isSuccess) in
            if(isSuccess){
               
            }else{
                
            }
        }
    }
}
