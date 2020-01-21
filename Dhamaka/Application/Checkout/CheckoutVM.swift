//
//  CheckoutVM.swift
//  Dhamaka
//
//  Created by Invariant on 19/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation

class CheckoutVM: BaseVM {
    
    let user = BISingletonHelper.shared.user
    var userOrder:SetOderMutation.Data.CreateOrder.Fragments? = nil
     var productList:[GetProductsQuery.Data.ProductsByMultipleId]?
    
    func placeOrder(shippingAddressId:String , billingAddressId:String, productList:[OrderProductInput],paymentmethod:PaymentMethod,odernote:String, complete:@escaping ((Bool) -> Void)) {
        apolloClient.perform(mutation: SetOderMutation(shippingDetailsId: shippingAddressId, billingDetailsId: billingAddressId, product: productList, paymentmethod: paymentmethod, ordernote: odernote)){ results in
            
            switch(results){
            case .success(let Order):
                print(Order)
              self.userOrder = Order.data?.createOrder.fragments
                complete(true)
                break
            case .failure(let error):
                print(error)
                break
            }
        }

    }

    var isAdreess: Bool {
        if user?.addresses?.count ?? 0 > 0 {
            return true
        }else{
            return false
        }
    }
    
    func address_id(_ index :Int) -> String {
        guard let address_id = user?.addresses![index].fragments.getAddress._id else {return ""}
        return address_id
    }
    
    func addressUserName(_ index :Int) -> String {
        guard let fname = user?.addresses![index].fragments.getAddress.firstName , let lname = user?.addresses![index].fragments.getAddress.lastName else {return "N/A"}
        return "\(fname) \(lname)"
    }
    
    func addressAdress(_ index:Int) -> String {
        guard let address = user?.addresses![index].fragments.getAddress.streetAddress else { return "N/A"}
        return address
    }
    
    func addressCity(_ index:Int) -> String {
        guard let city = user?.addresses![index].fragments.getAddress.city else { return "N/A"}
        return city
    }
    
    func addressPostCode(_ index:Int) -> String {
        guard let postcode = user?.addresses![index].fragments.getAddress.postCode  else { return "N/A"}
        return postcode
    }
    
    func addressCompleteAdress(_ index:Int) -> String {
        return "\(addressAdress(index)) \(addressCity(index))-\(addressPostCode(index))"
    }
    
    func addressPhoneNumber(_ index:Int) -> String {
        guard  let phoneNumber = user?.addresses![index].fragments.getAddress.phoneNumber else { return "N/A"}
        return phoneNumber
    }
    
    
    
    func productName (_ index:Int) -> String {
        guard let name = productList?[index].name else {return "N/A"}
        return "\(name) x \(database.getNumber(productid: productList?[index]._id ?? ""))"
    }
    
    func productPrice (_ index:Int) -> String {
        guard let price = productList?[index].price else {return "N/A"}
        return "\(price * Double(database.getNumber(productid: productList?[index]._id ?? ""))) Tk"
    }
    
    func TotalPrice() -> String {
        var sum = 0.0
        guard let products = productList else { return ""}
        for product in products {
            sum += product.price * Double(database.getNumber(productid: product._id))
        }
        return "\(sum) TK"
    }
    
    func TotalPriceWithShppingCost(Shipping:Double) -> String {
        var sum = 0.0
        guard let products = productList else { return ""}
        for product in products {
            sum += product.price * Double(database.getNumber(productid: product._id))
        }
        sum += Shipping
        return "\(sum) TK"
    }
    
    func prodcutCount() -> Int {
        return productList?.count ?? 0
    }
    
    var amount:Double {
        guard let amount = userOrder?.getOrder.total else {return 0.0}
        return amount
    }
    
    var trxId:String {
        guard let trxid = userOrder?.getOrder.trxId else {return ""}
        return trxid
    }
    
}
