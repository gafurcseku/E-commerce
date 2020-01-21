//
//  ProductDetailsVM.swift
//  Dhamaka
//
//  Created by Invariant on 13/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit

class ProductDetailsVM: BaseVM {
    
    var product:GetProductQuery.Data.Product?
    
    func getProduct(_id:String , completion: @escaping ((Bool) -> Void)) {
        apolloClient.fetch(query: GetProductQuery(_id:_id)){ results in
            switch results {
            case .success(let oneProdct):
                if (oneProdct.data?.product) != nil {
                    self.product = oneProdct.data?.product
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
    
    var productId : String{
        guard let prouct_id = product?.fragments.getProduct._id else { return "" }
        return prouct_id
    }
    
    var productName:String {
        guard let name = product?.fragments.getProduct.name else {return "N/A"}
        return name
    }
    
    var productPrice:String {
        guard let price = product?.fragments.getProduct.price else {return "N/A"}
        return "\(price) Tk"
    }
    
    var productShortDescription:String {
        guard let shortDescription = product?.fragments.getProduct.shortDescription else {return "N/A"}
        return shortDescription
    }
    
    var productdescription : String {
        guard let description = product?.fragments.getProduct.description else {return "N/A"}
        return description
    }
    
    var ratingValue:Double {
        guard let value = product?.fragments.getProduct.rating.fragments.getRating.value else {return 0.0 }
        return value
    }
    
    var ratingUserCount:Int {
        guard let userCount = product?.fragments.getProduct.rating.fragments.getRating.userCount else {return 0 }
        return userCount
    }
    
    var ratingFive:Double {
        guard let five = product?.fragments.getProduct.rating.fragments.getRating.ratingCount?.fragments.getRatingCount.five else {return 0.0 }
        return five
    }
    
    var ratingFour:Double {
          guard let four = product?.fragments.getProduct.rating.fragments.getRating.ratingCount?.fragments.getRatingCount.four else {return 0.0 }
          return four
      }
    
    var ratingThree:Double {
          guard let three = product?.fragments.getProduct.rating.fragments.getRating.ratingCount?.fragments.getRatingCount.three else {return 0.0 }
          return three
      }
    
    var ratingTwo:Double {
          guard let two = product?.fragments.getProduct.rating.fragments.getRating.ratingCount?.fragments.getRatingCount.two else {return 0.0 }
          return two
      }
    
    var ratingOne:Double {
          guard let one = product?.fragments.getProduct.rating.fragments.getRating.ratingCount?.fragments.getRatingCount.one else {return 0.0 }
          return one
      }
    
    var shippingPolicy : String {
        guard let shippingPolicy = product?.fragments.getProduct.shop.fragments.getShop.shippingInfo.fragments.getShippinginfo.shippingPolicy else {return "N/A"}
        return shippingPolicy
    }
    
    var refundPolicy : String {
        guard let refundPolicy = product?.fragments.getProduct.shop.fragments.getShop.shippingInfo.fragments.getShippinginfo.refundPolicy else {return "N/A"}
        return refundPolicy
    }
}
