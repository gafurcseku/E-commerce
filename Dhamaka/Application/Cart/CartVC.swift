//
//  CartVC.swift
//  Dhamaka
//
//  Created by Invariant on 18/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD
import ValueStepper


class CartVC : BaseVC {
    
    @IBOutlet weak var cartUITableView: UITableView!
    @IBOutlet weak var couponTextField: UITextField!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var scrollerView: UIScrollView!
    @IBOutlet weak var totalStackView: UIView!
    
    let viewModel = CartVM()
    
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollerView.contentLayoutGuide.bottomAnchor.constraint(equalTo: totalStackView.bottomAnchor).isActive = true
        prepairTable()
        
    }
    
    
    fileprivate func getCardProduct() {
        let products = database.getAllProduct()
        var product_id:[String] = []
        for product in products {
            product_id.append(product[database.product_id])
        }
        viewModel.getProducts(_id: product_id) { (isSuccess) in
            if isSuccess {
                self.showCartProduct()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getCardProduct()
        self.heightConstraint.constant = 2 * 123
        self.cartUITableView.reloadData()
    }
    
    @IBAction func applyAction(_ sender: UIButton) {
        
        var done:Bool = true
        let promoText = (couponTextField.text!).trimmingCharacters(in: .whitespacesAndNewlines)
        
        if(viewModel.isEmpty(text: promoText)){
            done = false
            Helper.showAlert(from: self, message: "promo Code Empty.")
        }
        
        if(done){
            viewModel.getPromoCode(code: promoText) { (isSuccess) in
                if(isSuccess){
                    if(self.viewModel.promoActive && self.viewModel.OrderAmountIsMinimum){
                        self.discountLabel.text = "\(self.viewModel.discountPrice) Tk"
                        self.subtitleLabel.text = self.viewModel.priceAfterDiscount
                        self.totalLabel.text = self.viewModel.priceAfterDiscount
                    }else{
                        Helper.showAlert(from: self, message: "Promo is not Apply. Thanks")
                    }
                }
            }
        }
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        dismissNav()
    }
    
    @IBAction func Checkout(_ sender: UIButton) {
        if Helper.isLoggedIn {
            if BISingletonHelper.shared.user == nil {
                SVProgressHUD.setStatus("Loading User Information")
                SVProgressHUD.show()
                viewModel.getUserById(userId: Helper.getUserID) { (isSuccess) in
                    SVProgressHUD.dismiss()
                    if isSuccess {
                        self.goCheckoutScreen()
                    }else{
                        self.goAuthoScreen()
                    }
                }
            }else{
                self.goCheckoutScreen()
            }
        }else{
            self.goAuthoScreen()
        }
    }
    
    private func goCheckoutScreen(){
        let checkoutVC = ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.Cart.rawValue, identifier: "checkout") as! CheckoutVC
        checkoutVC.productList = viewModel.productList
        self.navigationController?.pushViewController(checkoutVC, animated: true)
    }
    
    private func goAuthoScreen(){
        ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.Autho.rawValue, identifier: "autho", context:self)
    }
    
    func showCartProduct() {
        self.heightConstraint.constant = CGFloat((viewModel.productList?.count ?? 0) * 110)
        view.updateConstraints()
        self.cartUITableView.reloadData()
        
        self.discountLabel.text = "0.0 Tk"
        self.subtitleLabel.text = viewModel.TotalPrice
        self.totalLabel.text = viewModel.TotalPrice
        
    }
    
    func prepairTable() {
        self.cartUITableView.delegate = self
        self.cartUITableView.dataSource = self
        self.cartUITableView.reloadData()
    }
    
}

extension CartVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.productList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartVCTableViewCell
        cell.cartImage.sd_setImage(with: URL(string: "\(Dhamaka.imageBasseUrl)\(viewModel.productImage(indexPath.row))"), placeholderImage: UIImage(named: "Laptop-computer"))
        cell.cartProductName.text = viewModel.productName(indexPath.row)
        cell.cartProductPrice.text = viewModel.productPrice(indexPath.row)
        
        cell.ProductNumber.value = Double(database.getNumber(productid: viewModel.productId(indexPath.row)))
        cell.ProductNumber.tag = indexPath.row
        cell.ProductNumber.addTarget(self, action: #selector(CartVC.valueChanged), for: .valueChanged)
        
        cell.cartProductDelete.tag = indexPath.row
        cell.cartProductDelete.addTarget(self, action: #selector(CartVC.cartDelect), for: .touchUpInside)
        return cell
    }
    
    @objc func valueChanged(_ sender: ValueStepper) {
        database.updateCard(productid: viewModel.productId(sender.tag), number: Int(sender.value))
        if(viewModel.promoActive && viewModel.OrderAmountIsMinimum){
            self.discountLabel.text = "\(self.viewModel.discountPrice) Tk"
            self.subtitleLabel.text = viewModel.priceAfterDiscount
            self.totalLabel.text = viewModel.priceAfterDiscount
        }else{
            self.subtitleLabel.text = viewModel.TotalPrice
            self.totalLabel.text = viewModel.TotalPrice
        }
        
    }
    
    @objc func cartDelect(_ sender : UIButton) {
        Helper.showAlert(from: self, message: "Do you want to delect it") { (sucess) in
            if(sucess){
                let id = self.database.deleteCard(productid: self.viewModel.productId(sender.tag))
                if(id > 0 ){
                    self.getCardProduct()
                }
            }
        }
    }
}
