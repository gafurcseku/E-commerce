//
//  ProfileVC.swift
//  Dhamaka
//
//  Created by Invariant on 19/12/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import SVProgressHUD

class ProfileVC: BaseVC {
    @IBOutlet weak var firstNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var lastNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var mobileTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    
    var fname:String?
    var lname:String?
    var phoneNumber:String?
    var email:String?
    
    let viewModel = ProfileVM()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showInformation()
        
        self.firstNameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        self.lastNameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        self.mobileTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        self.emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    private func showInformation(){
        guard let user = BISingletonHelper.shared.user else { return }
        firstNameTextField.text = user.firstName
        lastNameTextField.text = user.lastName
        mobileTextField.text = user.phoneNumber
        emailTextField.text = user.email
    }
    
    @objc func textFieldDidChange(_ textfield: UITextField) {
        self.firstNameTextField.errorMessage = ""
        self.lastNameTextField.errorMessage = ""
        self.mobileTextField.errorMessage = ""
        self.emailTextField.errorMessage = ""
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        dismissNav()
    }
    
    
    @IBAction func updateAction(_ sender: UIButton) {
        var done:Bool = true
        fname = (firstNameTextField.text)?.trim()
         lname = (lastNameTextField.text)?.trim()
        phoneNumber = (mobileTextField.text)?.trim()
        email = (emailTextField.text)?.trim()
        
        if viewModel.isEmpty(text: fname){
            done = false
            firstNameTextField.errorMessage = "First Name is empty"
        } else if viewModel.isEmpty(text: lname){
            done = false
            lastNameTextField.errorMessage = "Last Name is Empty"
        }else if viewModel.isEmpty(text: phoneNumber) {
            done = false
            mobileTextField.errorMessage = "Mobile Number is Empty"
        } else if viewModel.isEmpty(text: email) {
            done = false
            emailTextField.errorMessage = "Email Address is Empty"
        }
        
        if(done){
            guard let user = BISingletonHelper.shared.user else { return }
            SVProgressHUD.setStatus("Update User Information")
            SVProgressHUD.show()
            viewModel.updateUser(fname: fname ?? "" , lname: lname ?? "" , phoneNumber: phoneNumber ?? "" , email: email ?? "" , _id: user._id) { (isSuccess) in
                if(isSuccess){
                     SVProgressHUD.dismiss()
                    self.dismissEvent()
                }
            }
        }
    }
    
}
