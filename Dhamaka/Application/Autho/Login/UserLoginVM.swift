//
//  UserLoginVM.swift
//  Dhamaka
//
//  Created by Invariant on 20/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import Apollo

class UserLoginVM: BaseVM {
    
    func UserLogin(email:String , password:String , complete: @escaping ((Bool) -> Void) ) {
        apolloClient.fetch(query: GetUserAuthQuery(email: email, password: password)){ results in
            
            switch results {
            case .success(let user):
                if user.data?.login != nil {
                    Helper.setLoggedIn(to: true)
                    Helper.setAccessToken(token: user.data?.login.fragments.getUser.token ?? "")
                    Helper.setUserID(user.data?.login.fragments.getUser._id ?? "")
                    BISingletonHelper.shared.user = user.data?.login.fragments.getUser
                    complete(true)
                }else{
                    complete(false)
                }
                break
            case .failure(let error):
                print(error.localizedDescription)
                complete(false)
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
}
