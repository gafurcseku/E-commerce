//
//  OrderHistoryListVC.swift
//  Dhamaka
//
//  Created by Invariant on 15/1/20.
//  Copyright © 2020 invariant. All rights reserved.
//


import UIKit
import SVProgressHUD

class OrderHistoryListVC: BaseVC {
    
    @IBOutlet weak var orderListTableView: UITableView!
     @IBOutlet weak var cartButton: MIBadgeButton!
    let viewModel = OrderHistoryListVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prePairTableView()
        SVProgressHUD.show()
        viewModel.getOrderHistroy(userId: Helper.getUserID, page: 1, limit: 1000) { (isSuccess) in
            SVProgressHUD.dismiss()
            if(isSuccess){
                self.orderListTableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
           cartButton.badgeString = "\(database.productCount())"
       }
    
    @IBAction func backAction(_ sender: UIButton) {
        dismissNav()
    }
    
    @IBAction func cartAction(_ sender: UIButton) {
     let cartVC = ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.Cart.rawValue, identifier:"cart")
    self.navigationController?.pushViewController(cartVC, animated: true)
    }
    
    
    
    fileprivate func prePairTableView(){
        self.orderListTableView.delegate = self
        self.orderListTableView.dataSource = self
        self.orderListTableView.rowHeight = UITableView.automaticDimension
        self.orderListTableView.reloadData()
    }
}

extension OrderHistoryListVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let history = ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.Histroy.rawValue, identifier:"orderHistory") as! OrderHistroyVC
        history.viewModel.orderHistory = self.viewModel.orderList?[indexPath.row]
        navigationController?.pushViewController(history, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderListCell", for: indexPath) as! OrderListTableViewCell
        cell.orderIdLabel.text = viewModel.getOrderId(indexPath.row)
        cell.OrderDateLabel.text = Helper.convertDate(milisecond: viewModel.orderPlaceDate(indexPath.row)) 
        cell.statusLabel.text = viewModel.orderStatus(indexPath.row)
        cell.productQtyLabel.text = viewModel.orderQyt(indexPath.row)
        cell.totalPriceLabel.text = viewModel.orderTotal(indexPath.row)
        return cell
    }
}
