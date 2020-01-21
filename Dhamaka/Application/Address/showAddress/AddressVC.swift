//
//  AddressVC.swift
//  Dhamaka
//
//  Created by Invariant on 21/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

class AddressVC: BaseVC {
    
    @IBOutlet weak var barTitleLabel: UILabel!
    @IBOutlet weak var addressTableView: UITableView!
    
    let viewModel = AddressVM()
    let userModel = UserLoginVM()
    
    public var bartitle:String = ""
    public var isShipping:Bool = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        barTitleLabel.text = bartitle
        prepairTable()
        
        SVProgressHUD.setStatus("Loading user information")
        SVProgressHUD.show()
        userModel.getUserById(userId: Helper.getUserID) { (isSuccess) in
            SVProgressHUD.dismiss()
            if(isSuccess){
                 self.addressTableView.reloadData()
            }
        }
        
    }
    
    func prepairTable() {
        self.addressTableView.dataSource = self
        self.addressTableView.delegate = self
        //self.addressTableView.reloadData()
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        dismissEvent()
    }
    
    @IBAction func addAddressUIButton(_ sender: UIButton) {
        let addressVc = ViewTransaction.viewTransaction.TransactionView(name:storyBoardName.Cart.rawValue, identifier: "saveAddress") as? SaveAddressVC
        addressVc!.bartitle = "Adress"
        self.present(addressVc!, animated: true, completion: nil)
    }
    
    
}

extension AddressVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.user?.addresses?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isShipping {
            Helper.setAddressNumber(indexPath.row, forkey: Constants.shipping)
        }else {
             Helper.setAddressNumber(indexPath.row, forkey: Constants.billing)
        }
         print("row: \(indexPath.row)")
        dismissEvent()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addressTable", for: indexPath) as! AddressVCTableViewCell
        
        cell.nameUILabel.text = viewModel.addressUserName(indexPath.row)
        cell.addressUITextView.text =  viewModel.addressCompleteAdress(indexPath.row)
        cell.phoneUILabel.text = viewModel.addressPhoneNumber(indexPath.row)
        cell.editUIButton.tag = indexPath.row
        cell.editUIButton.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func connected(sender: UIButton){
        let buttonTag = sender.tag
        let addressVc = ViewTransaction.viewTransaction.TransactionView(name:storyBoardName.Cart.rawValue, identifier: "saveAddress") as? SaveAddressVC
        addressVc!.bartitle = "Edit Adress"
        addressVc?.addressNumner = buttonTag
        self.present(addressVc!, animated: true, completion: nil)
    }
}
