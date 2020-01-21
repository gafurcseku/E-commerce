//
//  SaveAddressVC.swift
//  Dhamaka
//
//  Created by Invariant on 21/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField
import SVProgressHUD

class SaveAddressVC: BaseVC {
    
    
    @IBOutlet weak var barTitle: UILabel!
    @IBOutlet weak var firstNameText: SkyFloatingLabelTextField!
    @IBOutlet weak var lastNameText: SkyFloatingLabelTextField!
    @IBOutlet weak var addressText: SkyFloatingLabelTextField!
    @IBOutlet weak var postCodeText: SkyFloatingLabelTextField!
    @IBOutlet weak var cityText: SkyFloatingLabelTextField!
    @IBOutlet weak var phoneText: SkyFloatingLabelTextField!
    @IBOutlet weak var emailText: SkyFloatingLabelTextField!
    @IBOutlet weak var country: DropDown!
    
    
    let viewModel = SaveAddressVM()
    let UserModel = UserLoginVM()
    
    public var bartitle:String = ""
    public var address_id:String = ""
    public var addressNumner:Int? = nil
    private var countryName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barTitle.text = bartitle
        
        country.text = "Country"
        country.optionArray  = NSLocale.locales()
        country.didSelect{(selectedText , index ,id) in
            print("Selected String: \(selectedText) \n index: \(index) \n id: \(id)")
            self.countryName = selectedText
            
        }
        setupTextFld()
        
        if(addressNumner != nil){
            self.ShowAddress(addressNumner: addressNumner ?? 0)
        }
    }
    
    private func setupTextFld() {
        firstNameText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        lastNameText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        addressText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        postCodeText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        cityText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        phoneText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        emailText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textfield: UITextField) {
        firstNameText.errorMessage = ""
        lastNameText.errorMessage = ""
        addressText.errorMessage = ""
        postCodeText.errorMessage = ""
        cityText.errorMessage = ""
        phoneText.errorMessage = ""
        emailText.errorMessage = ""
    }
    
    private func ShowAddress(addressNumner:Int){
        address_id = viewModel.address_id(addressNumner)
        firstNameText.text = viewModel.addressFirstName(addressNumner)
        lastNameText.text = viewModel.addresslastName(addressNumner)
        addressText.text = viewModel.addressAdress(addressNumner)
        postCodeText.text = viewModel.addressPostCode(addressNumner)
        cityText.text = viewModel.addressCity(addressNumner)
        phoneText.text = viewModel.addressPhoneNumber(addressNumner)
        emailText.text = viewModel.addressEmail(addressNumner)
        country.text = viewModel.addressCountry(addressNumner)
        self.countryName = viewModel.addressCountry(addressNumner)
    }
    
    
    @IBAction func saveAction(_ sender: UIButton) {
        let firstnName = (firstNameText.text!).trimmingCharacters(in: .whitespacesAndNewlines)
        let lastName = (lastNameText.text!).trimmingCharacters(in: .whitespacesAndNewlines)
        let address = (addressText.text!).trimmingCharacters(in: .whitespacesAndNewlines)
        let postCode = (postCodeText.text!).trimmingCharacters(in: .whitespacesAndNewlines)
        let city = (cityText.text!).trimmingCharacters(in: .whitespacesAndNewlines)
        let email = (emailText.text!).trimmingCharacters(in: .whitespacesAndNewlines)
        let phone = (phoneText.text!).trimmingCharacters(in: .whitespacesAndNewlines)
        
        var shouldEnableSaveBtn:Bool = true
        
        if viewModel.isEmpty(text: firstnName){
            shouldEnableSaveBtn = false
            firstNameText.errorMessage = "First Name Empty"
        }else if viewModel.isEmpty(text: lastName) {
            shouldEnableSaveBtn = false
            lastNameText.errorMessage = "Last Name Empty"
        }else if viewModel.isEmpty(text: address){
            shouldEnableSaveBtn = false
            addressText.errorMessage = "Address is Empty"
        }else if viewModel.isEmpty(text: postCode){
            shouldEnableSaveBtn = false
            postCodeText.errorMessage = "Post Code is Empty"
        }else if viewModel.isEmpty(text: city){
            shouldEnableSaveBtn = false
            cityText.errorMessage = "City / Town is Empty"
        }else if viewModel.isEmpty(text: email){
            shouldEnableSaveBtn = false
            emailText.errorMessage = "Email is Empty"
        }else if viewModel.isEmpty(text: phone){
            shouldEnableSaveBtn = false
            phoneText.errorMessage = "Phone No is Empty"
        } else if (viewModel.isEmpty(text: countryName)){
            shouldEnableSaveBtn = false
            Helper.showAlert(from: self, message: "Please Select a Country.")
        }else if(!Helper.isValidPhoneNumber(phone).0){
            shouldEnableSaveBtn = false
            phoneText.errorMessage = "Phone No is inValid"
        }else if (!Helper.isValidEmail(email)){
            shouldEnableSaveBtn = false
            emailText.errorMessage = "Email is inValid"
        }
        
        if shouldEnableSaveBtn {
            SVProgressHUD.setStatus("Save User Information...")
            SVProgressHUD.show()
            print(address_id)
           
            viewModel.setSaveAndUpdateAddress(fname: firstnName, lname: lastName, country: countryName, streetAddress: address, postCode: postCode, city: city, phoneNumber: phone, email: email, addressId: address_id) { (isSuccess) in
                SVProgressHUD.dismiss()
                if isSuccess {
                    SVProgressHUD.setStatus("Loading User Information...")
                    SVProgressHUD.show()
                    self.UserModel.getUserById(userId: Helper.getUserID, complete: { (isSuccess) in
                        SVProgressHUD.dismiss()
                        self.dismissEvent()
                    })
                }else{
                    Helper.showAlert(from: self, message: "Addreass Update Fail.")
                }
            }
        }
        
    }
    
    
    
    @IBAction func backAction(_ sender: UIButton) {
        dismissEvent()
    }
    
}
