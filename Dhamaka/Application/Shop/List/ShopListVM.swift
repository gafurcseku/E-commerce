//
//  ShopListVM.swift
//  Dhamaka
//
//  Created by Invariant on 16/1/20.
//  Copyright © 2020 invariant. All rights reserved.
//

import Foundation

class ShopListVM: BaseVM {
    
    var shopList:[GetShopQuery.Data.Shop.Doc]?
    
    func getShopList(withpage page:Int , And limit:Int , complete:@escaping ((Bool) -> Void)) {
        apolloClient.fetch(query: GetShopQuery(page: page, limit: limit)){ results in
            switch(results){
            case .success(let shopList):
                self.shopList = shopList.data?.shops.docs
                print(shopList)
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
        return self.shopList?.count ?? 0
    }
    
       func getId(_ index:Int) -> String {
        guard let id = self.shopList?[index]._id else {return ""}
        return id
    }
    
    func getName(_ index:Int) -> String {
        guard let name = self.shopList?[index].basicInfo?.fragments.getBasicInfo.shopName else {return ""}
        return name
    }
    
    func getLogo(_ index:Int) -> String {
        guard let logo = self.shopList?[index].basicInfo?.fragments.getBasicInfo.logo else {return ""}
        return logo
    }
    
}
