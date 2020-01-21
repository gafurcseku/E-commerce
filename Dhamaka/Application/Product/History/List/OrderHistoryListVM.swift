//
//  OrderHistoryListVM.swift
//  Dhamaka
//
//  Created by Invariant on 15/1/20.
//  Copyright © 2020 invariant. All rights reserved.
//

import Foundation
import UIKit

class OrderHistoryListVM: BaseVM {
    
    var orderList:[GetOrderQuery.Data.Order.Doc]?
    
    func getOrderHistroy(userId:String,page:Int , limit:Int , complete:@escaping((Bool) -> Void))  {
        apolloClient.fetch(query: GetOrderQuery(_id: userId, page: page, limit: limit)){ results in
            switch(results) {
            case .success(let orders):
                self.orderList = orders.data?.orders.docs
                complete(true)
                break
            case .failure(let error):
                complete(false)
                print(error)
                break
            }
        }
    }
    
    func goHistory(navigationController:UINavigationController?) {
        let ProfileVC = ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.Histroy.rawValue, identifier:"orderHistory")
        navigationController?.pushViewController(ProfileVC, animated: true)
    }
    
    var count:Int {
        return orderList?.count ?? 0
    }
    
    func getOrderId(_ index:Int) -> String {
        guard let Id = self.orderList?[index]._id else {return "N/A"}
        return Id
    }
    
    func orderPlaceDate(_ index:Int) -> Int {
        guard let date = orderList?[index].createdAt else {return 0}
        return Int(date) ?? 0
    }
    
    func orderStatus(_ index:Int) -> String {
        guard let date = orderList?[index].status else {return "N/A"}
        return date.rawValue
    }
    
    func orderQyt(_ index:Int) -> String {
        var sum = 0
        guard let products = self.orderList?[index].products else { return ""}
        for product in products {
            sum += product.quantity
        }
        return "\(sum) Items"
    }
    
    func orderTotal(_ index:Int) -> String {
        guard let total = orderList?[index].total else {return "N/A"}
        return "Total: \(total) Tk"
    }
    
}
