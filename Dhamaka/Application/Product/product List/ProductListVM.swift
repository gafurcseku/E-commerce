//
//  ProductListVM.swift
//  Dhamaka
//
//  Created by Invariant on 26/12/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import SVProgressHUD

class ProductListVM: BaseVM {
    
    var products:[ProductsQuery.Data.Product.Doc]?
    
    func getProductList(category_id:String,page:Int , limit:Int, completion: @escaping ((Bool)->Void)) {
        SVProgressHUD.show()
        apolloClient.fetch(query: ProductsQuery(_id: category_id, page: page, limit: limit)) { result in
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
    
    func getPrice(_ index:Int) -> String {
        guard let price = products?[index].fragments.getProduct.price else {return "N/A"}
        return "\(price) Tk"
    }
    
    func getImageurl(_ index:Int) -> String {
        if products?[index].fragments.getProduct.thumnails?.count ?? 0  > 0 {
            return products?[index].fragments.getProduct.thumnails![0].image ?? ""
        }else {
            return ""
        }
    }
}
