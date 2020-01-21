//
//  UserManagerVM.swift
//  Dhamaka
//
//  Created by Invariant on 9/1/20.
//  Copyright © 2020 invariant. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

class UserManagerVM: BaseVM {
    
    func getLoginUser(userId:String, isProgress:Bool, complete:@escaping ((Bool) -> Void)) {
        if(Helper.isLoggedIn){
            if(BISingletonHelper.shared.user == nil){
                getUserById(userId: userId, isProgress: isProgress) { (isSuccess) in
                    if(isSuccess){
                        complete(true)
                    }else{
                        complete(false)
                    }
                }
            }else {
                complete(true)
            }
        }else{
            complete(false)
        }
    }
    
    func getUserById(userId:String,isProgress:Bool , complete:@escaping ((Bool) -> Void)) {
        if(isProgress){
            SVProgressHUD.setStatus("Loading User Information")
            SVProgressHUD.show()
        }
        apolloClient.fetch(query: GetLoginUserQuery(_id: userId)){ results in
             SVProgressHUD.dismiss()
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
    
    var userName:String {
        guard let firstName = BISingletonHelper.shared.user?.firstName , let lastName = BISingletonHelper.shared.user?.lastName else {return ""}
        return "\(firstName) \(lastName)"
    }
    
    var userEmail:String {
        guard let email = BISingletonHelper.shared.user?.email else { return ""}
        return email
    }
    
    var userImage:String{
        guard let avater = BISingletonHelper.shared.user?.avatar else { return ""}
        return avater
    }
    
    func goLogin(navigationController:UINavigationController?) {
        let userLoginVC = ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.Autho.rawValue, identifier: "autho")
        navigationController?.pushViewController(userLoginVC, animated: true)
    }
    
    func goProfile(navigationController:UINavigationController?) {
        let profileVC = ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.Autho.rawValue, identifier:"profile")
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    func goHistory(navigationController:UINavigationController?) {
        let historyVC = ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.Histroy.rawValue, identifier:"orderList")
        navigationController?.pushViewController(historyVC, animated: true)
    }
    
    func goShopList(navigationController:UINavigationController?) {
        let shopListVC = ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.ShopList.rawValue, identifier:"ShopList")
        navigationController?.pushViewController(shopListVC, animated: true)
    }
}
