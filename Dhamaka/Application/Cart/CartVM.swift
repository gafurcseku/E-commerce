//
//  CartVM.swift
//  Dhamaka
//
//  Created by Invariant on 18/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation

class CartVM: BaseVM {
    
    
    var product:GetProductQuery.Data.Product? = nil
    
    func getProduct(_id:String , completion: @escaping ((Bool) -> Void)) {
        apolloClient.fetch(query: GetProductQuery(_id:_id)){ results in
            switch results {
            case .success(let oneProdct):
                if (oneProdct.data?.product) != nil {
                    self.product = oneProdct.data?.product
                    BISingletonHelper.shared.product = self.product
                    completion(true)
                }else{
                    completion(false)
                }
                break
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    
    
    
    var productList:[GetProductsQuery.Data.ProductsByMultipleId]?
    
    func getProducts(_id:[String],completion: @escaping ((Bool) -> Void))  {
        apolloClient.fetch(query: GetProductsQuery(ids: _id)){ results in
            switch results {
            case .success(let products):
                if(products.data != nil){
                    self.productList = products.data!.productsByMultipleId
                    completion(true)
                }else{
                    completion(false)
                }
                break
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
    
    
    func getUserById(userId:String , complete:@escaping ((Bool) -> Void)) {
        apolloClient.fetch(query: GetLoginUserQuery(_id: userId)){ results in
            switch results {
            case .success(let userResult):
                print(userResult)
                if ( userResult.data?.user?.fragments.getUser) != nil {
                    BISingletonHelper.shared.user = userResult.data?.user?.fragments.getUser
                    complete(true)
                }else{
                    complete(false)
                }
                
                break
            case .failure(let error):
                print(error.localizedDescription)
                complete(false)
                break
            }
            
        }
    }
    
    var promo:SetPromoCodeQuery.Data.PromoCodeByCode?
    
    func getPromoCode(code:String, complete:@escaping((Bool) -> Void)) {
        apolloClient.fetch(query: SetPromoCodeQuery(code: code)){ results in
            switch results {
            case .success(let promoCode):
                print(promoCode)
                self.promo = promoCode.data?.promoCodeByCode
                complete(true)
                break
            case .failure(let error):
                print(error)
                complete(false)
                break
            }
            
        }
    }
    
    var promoOrderAmount:Int{
        guard let amount = self.promo?.fragments.getPromoCode.minimumOrderAmount else {return 0}
        return amount
    }
    
    var promoActive:Bool {
        guard let active = self.promo?.fragments.getPromoCode.active else {return false}
        return active
    }
    
    var promoDiscount:Int {
        guard let discount = self.promo?.fragments.getPromoCode.discount else {return 0}
        return discount
    }
    

    var promoDiscountType:DiscountType{
        guard let discountType = self.promo?.fragments.getPromoCode.discountType else {return DiscountType.percentage}
        return discountType
    }
    
    func isEmpty(text:String?) -> Bool {
        if let emptyText = text{
            if emptyText.containsNonWhitespace{
                return emptyText.count < 0
            } else {
                return true
            }
        } else {
            return true
        }
    }
    
    func productId (_ index:Int) -> String{
        guard let prouct_id = productList?[index]._id else { return "" }
        return prouct_id
    }
    
    func productName (_ index:Int) -> String {
        guard let name = productList?[index].name else {return "N/A"}
        return name
    }
    
    func productPrice (_ index:Int) -> String {
        guard let price = productList?[index].price else {return "N/A"}
        return "\(price) Tk"
    }
    
    func productImage (_ index:Int) -> String {
        if productList?[index].thumnails?.count ?? 0 > 0 {
            guard let image = productList?[index].thumnails![0].image else {return ""}
            return image
        }else {
            return ""
        }
    }
    
    var TotalPrice:String {
        var sum = 0.0
        guard let products = productList else { return ""}
        for product in products {
            sum += product.price * Double(database.getNumber(productid: product._id))
        }
        return "\(sum) TK"
    }
    
    var priceTotal:Double {
        var sum = 0.0
        guard let products = productList else { return 0.0}
        for product in products {
            sum += product.price * Double(database.getNumber(productid: product._id))
        }
        return sum
    }
    
    var discountPrice:Double{
        var discount = 0.0
        if(promoActive){
            if(promoDiscountType == DiscountType.percentage){
                discount = calculatePercentage(value: priceTotal, percentageVal: Double(promoDiscount))
            }else if(promoDiscountType == DiscountType.flat) {
                discount = Double(promoDiscount)
            }
            return discount
        }else{
            return 0.0
        }
    }
    
    public func calculatePercentage(value:Double,percentageVal:Double)->Double{
        let val = value * percentageVal
        return val / 100.0
    }

    
    var OrderAmountIsMinimum:Bool {
        return priceTotal >= Double(promoOrderAmount) ? true : false
    }
    
    var priceAfterDiscount:String{
        return "\(priceTotal - discountPrice) Tk"
    }
    
}
