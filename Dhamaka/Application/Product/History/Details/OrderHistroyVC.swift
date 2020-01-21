//
//  OrderHistroyVC.swift
//  Dhamaka
//
//  Created by Invariant on 15/1/20.
//  Copyright © 2020 invariant. All rights reserved.
//

import Foundation
import UIKit

class OrderHistroyVC: BaseVC {
    
    @IBOutlet weak var orderIdUILabel: UILabel!
    @IBOutlet weak var statusUILabel: UILabel!
    @IBOutlet weak var placeDateUILabel: UILabel!
    @IBOutlet weak var deliveryDateUILabel: UILabel!
    @IBOutlet weak var productListTableView: UITableView!
    
    @IBOutlet weak var shNameUILabel: UILabel!
    @IBOutlet weak var shAddressUILabel: UILabel!
    @IBOutlet weak var shMobileUILabel: UILabel!
    
    @IBOutlet weak var biNameUILabel: UILabel!
    @IBOutlet weak var biAddressUILabel: UILabel!
    @IBOutlet weak var biMobileUILabel: UILabel!
    
    @IBOutlet weak var SummaryTableView: UITableView!
    @IBOutlet weak var totalUILabel: UILabel!
    @IBOutlet weak var paymentTypeUILabel: UILabel!
    
    let viewModel = OrderHistoryVM()
    
    @IBOutlet weak var productTableConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var summaryTableConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showInformation()
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        dismissNav()
    }
    
    
    fileprivate func showInformation(){
        orderIdUILabel.text = viewModel.getOrderId
        totalUILabel.text = viewModel.orderTotal
        paymentTypeUILabel.text = viewModel.paymentType
        statusUILabel.text = viewModel.orderStatus
        placeDateUILabel.text = Helper.convertDate(milisecond: viewModel.orderPlaceDate)
        
        shNameUILabel.text = viewModel.shippingName
        shAddressUILabel.text = viewModel.shippingAddress
        shMobileUILabel.text = viewModel.shippingMobile
        
        biNameUILabel.text = viewModel.billingName
        biAddressUILabel.text = viewModel.billingAddress
        biMobileUILabel.text = viewModel.billingMobile
        
        self.productListTableView.delegate = self
        self.productListTableView.dataSource = self
        self.productListTableView.rowHeight =  UITableView.automaticDimension
        self.productTableConstraint.constant = CGFloat(viewModel.productCount * 105)
        self.productListTableView.reloadData()
        
        
        self.SummaryTableView.delegate = self
        self.SummaryTableView.dataSource = self
        self.SummaryTableView.rowHeight =  UITableView.automaticDimension
        self.summaryTableConstraint.constant = CGFloat(Double(viewModel.summaryCount) * 62)
        self.SummaryTableView.reloadData()
        
    }
    
}

extension OrderHistroyVC : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == self.productListTableView ? viewModel.productCount  : viewModel.summaryCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.productListTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
            cell.productImageView.sd_setImage(with: URL(string: "\(Dhamaka.imageBasseUrl)\(self.viewModel.productImage(indexPath.row))"), placeholderImage: UIImage(named: "Laptop-computer"))
            cell.nameUILabel.text = self.viewModel.productName(indexPath.row)
            cell.priceUILabel.text = self.viewModel.productPrice(indexPath.row)
            cell.quantityUILabel.text = self.viewModel.productQyt(indexPath.row)
            return cell
        }else if tableView == self.SummaryTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "summaryCell", for: indexPath) as! SummaryTableViewCell
            if(indexPath.row < self.viewModel.productCount ){
                cell.nameUILabel.text = self.viewModel.summaryName(indexPath.row)
                cell.priceUILabel.text = self.viewModel.summaryPrice(indexPath.row)
            }else if(indexPath.row == self.viewModel.productCount ){
                cell.nameUILabel.text = "Discount"
                cell.priceUILabel.text = self.viewModel.summaryDiscount
            }else if(indexPath.row == self.viewModel.productCount + 1 ){
                cell.nameUILabel.text = "Shipping Fee"
                cell.priceUILabel.text = self.viewModel.summarySppin
            }
            return cell
        }
        return UITableViewCell()
    }
    
}
