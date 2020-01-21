//
//  HomeVM.swift
//  Dhamaka
//
//  Created by Invariant on 11/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import SVProgressHUD
import Apollo

class HomeVM :BaseVM {
    
    var products:[GetProductListQuery.Data.Product.Doc]?
    
    func getProductList(page:Int , limit:Int, completion: @escaping ((Bool)->Void)) {
        SVProgressHUD.show()
        apolloClient.fetch(query: GetProductListQuery(page: page, limit: limit)) { result in
            SVProgressHUD.dismiss()
            switch result {
            case .success(let productList):
                if productList.data != nil {
                    self.products = (productList.data?.products.docs)!
                 completion(true)
                }else{
                    completion(false)
                }
                print(productList)
            case .failure(let  error):
                print(error)
                 completion(false)
            }
            
        }
        
    }
    
    
     func prodcutCount() -> Int {
         return products?.count ?? 0
     }
    
    func getId(_ index:Int) -> String {
       guard let id = products?[index].fragments.getProduct._id else {return ""}
        return id
    }
     
     func getName(_ index:Int) -> String {
        guard let name = products?[index].fragments.getProduct.name else {return "N/A"}
         return name
     }
    
    func getRating(_ index:Int) -> Double {
        guard let rating = products?[index].fragments.getProduct.rating.fragments.getRating.value else {return 0.0 }
        return rating
    }
    
     
     func getPrice(_ index:Int) -> Double {
        guard let price = products?[index].fragments.getProduct.price else {return 0.0 }
         return price
     }
    
    func getOldPrice(_ index:Int) -> Double {
        guard let oldPrice = products?[index].fragments.getProduct.oldPrice else {return 0.0 }
        return oldPrice
    }
     
     func getThumnails(_ index:Int) -> String {
        if products?[index].fragments.getProduct.thumnails?.count ?? 0  > 0 {
            return products?[index].fragments.getProduct.thumnails![0].image ?? ""
         }else {
             return ""
         }
     }
    
    func sectionValue(section:Int) -> (Bool , String) {
        if section == 0 {
            return (sectionType["slider"] ?? false, "")
        }else if section == 1 {
            return (sectionType["category"] ?? false,"")
        }else if section == 2 {
            return (sectionType["live"] ?? false,"LIVE NOW")
        }else if section == 3 {
            return (sectionType["feature"] ?? false,"FEATURED")
        }else if section == 4 {
            return (sectionType["all"] ?? false,"ALL PRODUCTS")
        }else if section == 5 {
            return (sectionType["Hot"] ?? false,"HOT CATEGORIES")
        }else if section == 6 {
            return (sectionType["bestsell"] ?? false,"BESTSSELL")
        }else if section == 7 {
            return (sectionType["new"] ?? false,"NEW ARRIVALS")
        }else {
            return (false,"")
        }
    }
}
