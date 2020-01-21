//
//  ShopDetailVM.swift
//  Dhamaka
//
//  Created by Invariant on 16/1/20.
//  Copyright © 2020 invariant. All rights reserved.
//

import Foundation

class ShopDetailVM: BaseVM {
    
    var shop:GetShopQuery.Data.Shop.Doc?
    
    var productList:[ProductsBySellerQuery.Data.Product.Doc]?
    
    func getShopProduct(seller_id:String, page:Int, limit:Int, complete:@escaping ((Bool) -> Void) ) {
        apolloClient.fetch(query: ProductsBySellerQuery(_id: seller_id, page: page, limit: limit)){ results in
            switch(results){
            case .success(let products):
                self.productList = products.data?.products.docs
                print(products)
                complete(true)
                break
            case .failure(let error):
                print(error)
                complete(false)
                break
            }
        }
    }
    
    var getCount:Int{
        return productList?.count ?? 0
    }
    
    func productImage(_ index:Int) -> String {
        guard let image = self.productList?[index].fragments.getProduct.thumnails?[0].image else {return "N/A"}
        return image
    }
    
    func productName(_ index:Int) -> String {
        guard let name = self.productList?[index].fragments.getProduct.name else {return "N/A"}
         return name
     }
    
    func productRating(_ index:Int) -> Double {
        guard let rating = self.productList?[index].fragments.getProduct.rating.fragments.getRating.value else {return 0.0}
         return rating
     }
    
    func productPrice(_ index:Int) -> String {
        guard let price = self.productList?[index].fragments.getProduct.price else {return "N/A"}
         return "\(price) Tk"
     }
    
    var Name:String {
        guard let name = self.shop?.basicInfo?.fragments.getBasicInfo.shopName else {return ""}
        return name
    }
    
    var logo:String {
        guard let logo = self.shop?.basicInfo?.fragments.getBasicInfo.logo else {return ""}
        return logo
    }
    
    var bannar:String {
        guard let bannar = self.shop?.basicInfo?.fragments.getBasicInfo.bannar else {return ""}
        return bannar
    }
    
    var address:String {
         guard let address = self.shop?.basicInfo?.fragments.getBasicInfo.address else {return ""}
         return address
     }
    
    var phoneNumber:String {
          guard let phoneNumber = self.shop?.basicInfo?.fragments.getBasicInfo.phoneNumber else {return ""}
          return phoneNumber
      }
    
    var email:String {
             guard let email = self.shop?.basicInfo?.fragments.getBasicInfo.email else {return ""}
             return email
         }
    
}
