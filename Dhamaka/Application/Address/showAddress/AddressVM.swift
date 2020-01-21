//
//  AddressVM.swift
//  Dhamaka
//
//  Created by Invariant on 21/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation

class AddressVM: BaseVM {
    
    let user = BISingletonHelper.shared.user
    
    var isAdreess: Bool {
        if user?.addresses?.count ?? 0 > 0 {
            return true
        }else{
            return false
        }
    }
    
    func addressUserName(_ index :Int) -> String {
        guard let fname = user?.addresses![index].fragments.getAddress.firstName , let lname = user?.addresses![index].fragments.getAddress.lastName else {return "N/A"}
        return "\(fname) \(lname)"
    }
    
    func addressAdress(_ index:Int) -> String {
        guard let address = user?.addresses![index].fragments.getAddress.streetAddress else { return "N/A"}
        return address
    }
    
    func addressCity(_ index:Int) -> String {
        guard let city = user?.addresses![index].fragments.getAddress.city else { return "N/A"}
        return city
    }
    
    func addressPostCode(_ index:Int) -> String {
        guard let postcode = user?.addresses![index].fragments.getAddress.postCode  else { return "N/A"}
        return postcode
    }
    
    func addressCompleteAdress(_ index:Int) -> String {
        return "\(addressAdress(index)) \(addressCity(index))-\(addressPostCode(index))"
    }
    
    func addressPhoneNumber(_ index:Int) -> String {
        guard  let phoneNumber = user?.addresses![index].fragments.getAddress.phoneNumber else { return "N/A"}
        return phoneNumber
    }
}
