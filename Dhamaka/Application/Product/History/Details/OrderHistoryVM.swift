//
//  OrderHistoryVM.swift
//  Dhamaka
//
//  Created by Invariant on 15/1/20.
//  Copyright © 2020 invariant. All rights reserved.
//

import Foundation

class OrderHistoryVM: BaseVM {
    
      var orderHistory:GetOrderQuery.Data.Order.Doc?
    
    var getOrderId:String {
        guard let Id = self.orderHistory?._id else {return "N/A"}
        return Id
    }
    
    var orderPlaceDate:Int {
        guard let date = self.orderHistory?.createdAt else {return 0}
        return Int(date) ?? 0
    }
    
    var orderStatus:String {
        guard let date = self.orderHistory?.status else {return "N/A"}
        return date.rawValue
    }
        
    var orderTotal:String {
        guard let total = self.orderHistory?.total else {return "N/A"}
        return "\(total) Tk"
    }
    
    var shippingName:String{
        guard let fname = self.orderHistory?.shippingDetails?.fragments.getAddress.firstName , let lname = self.orderHistory?.shippingDetails?.fragments.getAddress.lastName else {return "N/A"}
        return "\(fname) \(lname)"
    }
    
    var billingName:String{
        guard let fname = self.orderHistory?.billingDetails?.fragments.getAddress.firstName , let lname = self.orderHistory?.billingDetails?.fragments.getAddress.lastName else {return "N/A"}
        return "\(fname) \(lname)"
    }
    
    
    var shippingAddress:String{
        guard let address = self.orderHistory?.shippingDetails?.fragments.getAddress.streetAddress , let city = self.orderHistory?.shippingDetails?.fragments.getAddress.city , let postCode = self.orderHistory?.shippingDetails?.fragments.getAddress.postCode else {return "N/A"}
        return "\(address) \(city) \(postCode)"
    }
    
    var billingAddress:String{
        guard let address = self.orderHistory?.billingDetails?.fragments.getAddress.streetAddress , let city = self.orderHistory?.billingDetails?.fragments.getAddress.city , let postCode = self.orderHistory?.billingDetails?.fragments.getAddress.postCode else {return "N/A"}
        return "\(address) \(city) \(postCode)"
    }
    
    var shippingMobile:String{
        guard let mobile = self.orderHistory?.shippingDetails?.fragments.getAddress.phoneNumber else {return "N/A"}
        return mobile
    }
    
    var billingMobile:String{
        guard let mobile = self.orderHistory?.shippingDetails?.fragments.getAddress.phoneNumber else {return "N/A"}
        return mobile
    }
    
    var paymentType:String {
        guard let type = self.orderHistory?.paymentMethod else {return "N/A"}
        if(type == PaymentMethod.cod){
            return "Cash on Delivery"
        }else {
            return "Payment with Digital Wallet"
        }
    }
    
    var productCount:Int {
        return self.orderHistory?.products?.count ?? 0
    }
    
    var summaryCount:Int {
        return (self.orderHistory?.products?.count  ?? 0 ) + 2
    }
    
    func productImage(_ index:Int) -> String {
        guard let image = self.orderHistory?.products?[index].product?.fragments.getProduct.thumnails?[0].image else {return "N/A"}
        return image
    }
    
    func productName(_ index:Int) -> String {
        guard let name = self.orderHistory?.products?[index].product?.fragments.getProduct.name else {return "N/A"}
        return name
    }
    
    func productPrice(_ index:Int) -> String {
        guard let price = self.orderHistory?.products?[index].product?.fragments.getProduct.price else {return "N/A"}
        return "\(price) Tk"
    }
    
    func productQyt(_ index:Int) -> String {
        guard let qyt = self.orderHistory?.products?[index].quantity else {return "N/A"}
        return "Qty: \(qyt)"
    }
    
    func summaryName(_ index:Int) -> String {
        guard let name = self.orderHistory?.products?[index].product?.fragments.getProduct.name else {return "N/A"}
        return "\(name) x \(summarytQyt(index))"
    }
    
    func summaryPrice(_ index:Int) -> String {
        guard let price = self.orderHistory?.products?[index].product?.fragments.getProduct.price else {return "N/A"}
        return "\(price) Tk"
    }
    
    var summaryDiscount:String {
        guard let discount = self.orderHistory?.discount else {return "N/A"}
        return "\(discount) Tk"
    }
    
    var summarySppin:String {
        guard let shipping = self.orderHistory?.shipping else {return "N/A"}
        return "\(shipping) Tk"
    }
    
    func summarytQyt(_ index:Int) -> String {
        guard let qyt = self.orderHistory?.products?[index].quantity else {return "N/A"}
        return "\(qyt)"
    }
    
}
