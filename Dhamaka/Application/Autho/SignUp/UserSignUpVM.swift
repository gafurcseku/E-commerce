//
//  UserSignUpVM.swift
//  Dhamaka
//
//  Created by Invariant on 24/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit

class UserSignUpVM: BaseVM {
    

    func sendOTP(phone:String,complete:@escaping ((Bool,String) -> Void)) {
        apolloClient.perform(mutation: SendSmsMutation(phone: phone)){ results in
            switch results {
            case .success(let messgae):
                if(messgae.errors == nil){
                    complete(true ,  messgae.data?.sendOtpToPhone ?? "")
                }else{
                    complete(false ,  messgae.errors?.description ?? "")
                }
                
                break
            case .failure(let error):
                print(error.localizedDescription)
                complete(false, "")
                break
            }
        }
    }
    
    func verificationOTP(phone:String,otp:String, complete:@escaping ((Bool) -> Void)){
        apolloClient.perform(mutation: VerifySmsMutation(phone: phone, otp: otp)) { results in
            switch results {
            case .success(let success):
                complete(success.data?.verifyOtpPhone ?? false)
                break
            case .failure(let error):
                print(error.localizedDescription)
                complete(false)
                break
            }
        }
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
}
