//
//  CheckoutVC.swift
//  Dhamaka
//
//  Created by Invariant on 19/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit
#if !targetEnvironment(simulator)
import SSLCommerz
#endif


class CheckoutVC: BaseVC , RadioButtonGroupDelegate {
    
    @IBOutlet weak var shippingUserNameUILabel: UILabel!
    @IBOutlet weak var shippingUserAdressUITextView: UITextView!
    @IBOutlet weak var shippingUserPhoneLabel: UILabel!
    @IBOutlet weak var shippingUseraddressChange: UIButton!
    
    
    @IBOutlet weak var BillingUserNameUILabel: UILabel!
    @IBOutlet weak var BillingUserAdressUITextView: UITextView!
    @IBOutlet weak var BillingUserPhoneLabel: UILabel!
    @IBOutlet weak var BillingUseraddressChange: UIButton!
    
    @IBOutlet weak var cashRadioButton: PVRadioButton!
    @IBOutlet weak var creditRadioButton: PVRadioButton!
    @IBOutlet weak var digitalRadioButton: PVRadioButton!
    @IBOutlet weak var orderUITableView: UITableView!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    var radioButtonGroup: PVRadioButtonGroup!
    var payment:PaymentMethod = PaymentMethod.cod
    
    
    let viewModel = CheckoutVM()
    var productList:[GetProductsQuery.Data.ProductsByMultipleId]?
    private var orderOther:Int = 0
    
    #if !targetEnvironment(simulator)
    var sslCom:SSLCommerz?
    #endif
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        radioButtonGroup = PVRadioButtonGroup()
        radioButtonGroup.delegate = self
        cashRadioButton.isRadioSelected = true
        radioButtonGroup.appendToRadioGroup(radioButtons: [cashRadioButton,creditRadioButton,digitalRadioButton])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        AdressInformation()
        viewModel.productList = self.productList
        self.initOrderTableView()
    }
    
    func radioButtonClicked(button: PVRadioButton) {
        print(button.titleLabel?.text ?? "")
        if button.titleLabel?.text == "Cash on Delivery" {
            payment = PaymentMethod.cod
        } else if button.titleLabel?.text == "Credit/Debit Card" {
            payment = PaymentMethod.sslcommerz
        }else if button.titleLabel?.text == "Payment with Digital Wallet" {
            payment = PaymentMethod.sslcommerz
        }
    }
    
    private func initOrderTableView(){
        self.orderUITableView.delegate = self
        self.orderUITableView.dataSource = self
        self.heightConstraint.constant = CGFloat((viewModel.prodcutCount() + 4) * 35)
        //  view.updateConstraints()
        self.orderUITableView.reloadData()
    }
    
    @IBAction func shippingChangeAction(_ sender: UIButton) {
        self.goAddress(ishipping: true)
    }
    
    func goAddress(ishipping:Bool) {
        if viewModel.isAdreess {
            let addressVc = ViewTransaction.viewTransaction.TransactionView(name:storyBoardName.Cart.rawValue, identifier: "address") as? AddressVC
            addressVc!.bartitle = "Adress"
            addressVc?.isShipping = ishipping
            self.present(addressVc!, animated: true, completion: nil)
        }else{
            let addressVc = ViewTransaction.viewTransaction.TransactionView(name:storyBoardName.Cart.rawValue, identifier: "saveAddress") as? SaveAddressVC
            addressVc!.bartitle = "Adress"
            self.present(addressVc!, animated: true, completion: nil)
        }
    }
    
    @IBAction func billingChangeAction(_ sender: UIButton) {
        self.goAddress(ishipping: false)
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        dismissNav()
    }
    
    
    @IBAction func createOrderAction(_ sender: UIButton) {
        let shipping_id = viewModel.address_id(Helper.getAddressNumber(forkey: Constants.shipping))
        let billing_id = viewModel.address_id(Helper.getAddressNumber(forkey: Constants.billing))
        var productList:[OrderProductInput]? = []
        let products = database.getAllProduct()
        for aProduct in products {
            let product = OrderProductInput(product: aProduct[database.product_id], quantity: aProduct[database.numberOfproduct])
            productList?.append(product)
        }
        
        viewModel.placeOrder(shippingAddressId: shipping_id, billingAddressId: billing_id, productList: productList!, paymentmethod: payment, odernote: "") { (isSuccess) in
            if(isSuccess){
                if(self.payment == PaymentMethod.cod){
                    self.goThanks()
                }else{
                    #if !targetEnvironment(simulator)
                    self.sslCom = SSLCommerz.init(integrationInformation: .init(storeID: "test_mtfb001", storePassword: "test_mtfb001@ssl", totalAmount: self.viewModel.amount, currency: "BDT", transactionId: self.viewModel.trxId, productCategory: self.payment.rawValue))
                    self.sslCom?.delegate = self
                    self.sslCom?.start(in: self, shouldRunInTestMode: true)
                    #endif
                    
                }
            }
        }
    }
    
    
    func AdressInformation() -> Void {
        guard BISingletonHelper.shared.user != nil else { return }
        if viewModel.isAdreess {
            let shippingNumber = Helper.getAddressNumber(forkey: Constants.shipping)
            self.shippingUserNameUILabel.text = viewModel.addressUserName(shippingNumber)
            self.shippingUserAdressUITextView.text = viewModel.addressCompleteAdress(shippingNumber)
            self.shippingUserPhoneLabel.text = viewModel.addressPhoneNumber(shippingNumber)
            self.shippingUseraddressChange.setTitle("Change", for: .normal)
            
            let billingNumber = Helper.getAddressNumber(forkey: Constants.billing)
            self.BillingUserNameUILabel.text = viewModel.addressUserName(billingNumber)
            self.BillingUserAdressUITextView.text = viewModel.addressCompleteAdress(billingNumber)
            self.BillingUserPhoneLabel.text = viewModel.addressPhoneNumber(billingNumber)
            self.BillingUseraddressChange.setTitle("Change", for: .normal)
        }else{
            self.shippingUserNameUILabel.text = ""
            self.shippingUserAdressUITextView.text = ""
            self.shippingUserPhoneLabel.text = ""
            
            
            self.BillingUserNameUILabel.text = ""
            self.BillingUserAdressUITextView.text = ""
            self.BillingUserPhoneLabel.text = ""
            
        }
    }
    
    func goThanks() {
        let OrderSuccessVC =  ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.Cart.rawValue, identifier: "success")
        self.navigationController?.pushViewController(OrderSuccessVC, animated: true)
        
    }
}

extension CheckoutVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  ( viewModel.prodcutCount() + 4 )
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderTableview", for: indexPath) as! CheckoutVCTableViewCell
        if(viewModel.prodcutCount()>indexPath.row){
            cell.itemNameUILabel.text = viewModel.productName(indexPath.row)
            cell.itemPriceUILabel.text = viewModel.productPrice(indexPath.row)
        }else{
            if(orderOther == 0){
                cell.itemNameUILabel.text = "Subtotal"
                cell.itemPriceUILabel.text = viewModel.TotalPrice()
            }else if(orderOther == 1){
                cell.itemNameUILabel.text = "Discount"
                cell.itemPriceUILabel.text = "00.00 Tk"
            }else if(orderOther == 2){
                cell.itemNameUILabel.text = "Shipping Fee"
                cell.itemPriceUILabel.text = "60.00 Tk"
            }else if(orderOther == 3) {
                cell.itemNameUILabel.text = "Total"
                cell.itemPriceUILabel.text = viewModel.TotalPriceWithShppingCost(Shipping: 60.00)
            }
            orderOther = orderOther + 1
        }
        return cell
    }
}

#if !targetEnvironment(simulator)
extension CheckoutVC:SSLCommerzDelegate {
    func transactionCompleted(withTransactionData transactionData: TransactionDetails?) {
        
        if(transactionData?.status == "FAILED") {
            Helper.showAlert(from: self, message: "Online Payment Fail.")
        }else{
            goThanks()
        }
    }
}
#endif



