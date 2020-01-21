//
//  UserRegistrationVM.swift
//  Dhamaka
//
//  Created by Invariant on 24/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit

class UserRegistrationVM: BaseVM {
    
    func registrationByPhone(fname:String, lname:String, phoneNumber:String,otp:String, email:String, password:String, complete:@escaping ((Bool) -> Void)) {
        apolloClient.perform(mutation: RegistrationByPhoneMutation(fname: fname, lname: lname, phoneNumber: phoneNumber, otp: otp, email: email, password: password)){ results in
            switch results {
            case .success( _):
                complete(true)
                break
            case .failure(let error):
                complete(false)
                print(error.localizedDescription)
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
    
    func isValidEmail(_ email: String?) -> Bool {
        guard email?.count != 0 else {return false}
        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    
    func FullNameSplit(name:String?) -> (String,String) {
        if let nameText = name {
            let fullNameArr = nameText.components(separatedBy: " ")
            let firstName: String = fullNameArr[0]
            let lastName: String? = fullNameArr.count > 1 ? fullNameArr[1] : nil
            return (firstName,lastName ?? "")
        }else {
            return ("","")
        }
    }
}
