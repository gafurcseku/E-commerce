//
//  SaveAddressVM.swift
//  Dhamaka
//
//  Created by Invariant on 21/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation

class SaveAddressVM: BaseVM {
    
    let user = BISingletonHelper.shared.user
    
    func setSaveAndUpdateAddress(fname:String, lname:String, country:String, streetAddress:String, postCode:String, city:String, phoneNumber:String, email:String , addressId:String , complete:@escaping ((Bool) -> Void)) {
        apolloClient.perform(mutation: UpdateAndCreateUserAddressMutation(fname: fname, lname: lname, country: country, streetAddress: streetAddress, postCode: postCode, city: city, phoneNumber: phoneNumber, email: email, addressId: addressId)){ results in
            
            switch(results){
            case .success(let address):
                print(address)
                complete(true)
                break
            case .failure(let error) :
                print(error)
                complete(false)
                break
            }
            
        }
        
    }
    
    
    func getFirstAndLastName(from fullName: String?) -> (String,String) {
        guard let name = fullName else {return ("","")}
        let nameArr = name.components(separatedBy: " ")
        if nameArr.count == 0 {return ("","")}
        if  nameArr.count > 1 {
            return (nameArr[0], nameArr[1])
        }else {
            return (nameArr[0], "")
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
    
    func address_id(_ index :Int) -> String {
        guard let address_id = user?.addresses![index].fragments.getAddress._id else {return ""}
        return address_id
    }
    
    
    func addressFirstName(_ index :Int) -> String {
        guard let fname = user?.addresses![index].fragments.getAddress.firstName else {return "N/A"}
        return fname
    }
    
    func addresslastName(_ index :Int) -> String {
        guard let lname = user?.addresses![index].fragments.getAddress.lastName else {return "N/A"}
        return lname
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
    
    func addressEmail(_ index:Int) -> String {
        guard  let email = user?.addresses![index].fragments.getAddress.email else { return "N/A"}
        return email
    }
    
    func addressCountry(_ index:Int) -> String {
        guard  let country = user?.addresses![index].fragments.getAddress.country else { return "N/A"}
        return country
    }
}
